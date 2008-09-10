require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/comments/show.html.erb" do
  include CommentsHelper
  
  before(:each) do
    assigns[:comment] = @comment = stub_model(Comment,
      :content => "value for content"
    )
  end

  it "should render attributes in <p>" do
    render "/comments/show.html.erb"
    response.should have_text(/value\ for\ content/)
  end
end

