require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ZoteroIngestsController do

  # This should return the minimal set of attributes required to create a valid
  # ZoteroIngest. As you add validations to ZoteroIngest, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all zotero_ingests as @zotero_ingests" do
      zotero_ingest = ZoteroIngest.create! valid_attributes
      get :index
      assigns(:zotero_ingests).should eq([zotero_ingest])
    end
  end

  describe "GET show" do
    it "assigns the requested zotero_ingest as @zotero_ingest" do
      zotero_ingest = ZoteroIngest.create! valid_attributes
      get :show, :id => zotero_ingest.id.to_s
      assigns(:zotero_ingest).should eq(zotero_ingest)
    end
  end

 

end
