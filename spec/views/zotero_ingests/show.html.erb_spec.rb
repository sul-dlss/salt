require 'spec_helper'

describe "zotero_ingests/show.html.erb" do
  before(:each) do
    @zotero_ingest = Factory.create(:zotero_ingest)
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Filename/)
  end
end
