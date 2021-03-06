# this is used to track ingested zotero export files. The ZoteroDirectoryWatcher (script/background/zotero_directory_watcher.rb) deamon kicks off the processes.

class ZoteroIngest < ActiveRecord::Base

  attr_accessor :inprocess_directory
  attr_accessor :out_directory
  attr_accessor :error_directory
  attr_accessor :rdf_file
  attr_accessor :processing_file





  after_initialize do
    self.message ||= ""
    @inprocess_directory = File.join(Settings.directory_watcher.local, "inprocess")
    @out_directory = File.join(Settings.directory_watcher.local, "completed")
    @error_directory = File.join(Settings.directory_watcher.local, "error")
    make_directories    
  end

#
# This method is used by the zotero_ingest background daemon to process new files for ingest. 
def process_file
  unless self.filename.nil?
    
    self.save #we need to first save to ensure we have a proper obj ID. 
    
    timestamp = render_now
    
    log_message("[#{timestamp}] - Starting Zotero Ingest. ")
    log_message("Process file at #{self.filename}")
    
    
    @processing_file = File.join(@inprocess_directory, "#{File.basename(self.filename,".rdf")}-#{timestamp}.rdf" )
    FileUtils.mv(self.filename,  @processing_file)

    log_message("Moving #{file} to  #{@processing_file}")
    log_message("Starting ZoteroParser")
   
    
    zotero_parser = Stanford::ZoteroParser.new(@processing_file, self)
    zotero_parser.process_document

    update_index(zotero_parser.processed_druids)
    check_data()
      
    outdir = File.join(@out_directory, timestamp)
    FileUtils.mkpath(outdir)
    FileUtils.mv(@processing_file, outdir )

    log_message("Parser completed. Moving #{@processing_file} to #{File.join(outdir, filename )}")
   
    
   
    
    
    log_message(zotero_parser.processed_druids.join(" , "))
    
    self.save! 
  end

rescue => e
  log_message("Zotero Import Error -- File: #{File.join(@inprocess_directory, filename)}")
  log_message("Errors: #{e.inspect} #{e.backtrace.join('\n')}")
  
   outdir = File.join(@error_directory, render_now)
   FileUtils.mkpath(outdir)
   FileUtils.mv(@processing_file, outdir )
   File.open(File.join(outdir, "error.txt"), "w") { |f| f << "#{e.inspect} #{e.backtrace.join('\n')}" }
end


# takes an array of druids to be updated and indexes the documents into solr.
 def update_index(druids=[])
   index = Stanford::Indexer.new(druids, self)
   index.process_queue
 end

 def check_data
   checkr = Stanford::SolrCheckr.new(@processing_file, self)
   checkr.check_documents
 end


private

  def make_directories
      [@inprocess_directory, @out_directory, @error_directory].each {|dir| FileUtils.mkpath(dir)}
  end
  
  
  # convience method to generate timestamp directory names
  def render_now
    return Time.now.strftime("%Y-%m-%d_%H-%M-%s")  
  end

  def log_message(msg)
    logger.info msg
  end


  

end
