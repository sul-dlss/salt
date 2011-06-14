require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
include AssetHelper


describe AssetHelper do
  

  it "should return the proper url based on the asset ID" do
    helper.flipbook_tag("foobar").should ==  "<iframe src='/assets/foobar.flipbook' width='99%' height='450px'/><a href='/assets/foobar.flipbook' style='cursor:pointer;' onclick=\"window.open('/assets/foobar.flipbook','status=0','toolbar=0','location=0','menubar=0','directories=0','navigation=0');return false;\">Open viewer in new window</a><br/><a href='/assets/foobar.pdf' style='cursor:pointer;' onclick=\"window.open('/assets/foobar.pdf], 'status=0', 'toolbar=0', 'location=0', 'menubar=0', 'directories=0', 'navigation=0'); return false;\">Download PDF</a>"
  end
  
  
end