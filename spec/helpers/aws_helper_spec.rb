require 'spec_helper'


describe AwsHelper do
  describe "#get_s3_url" do
    let (:data) { "some random data" }
    let (:mimeType) { "image/png" }
    let (:extension) { "png" }
  end

  describe "#generate_name" do
    let (:extension) { "png" }
    it "should have the right extension" do
      helper.generate_name(extension).should have_content(extension)
    end

    it "should be ten characters plus the extension" do
      helper.generate_name(extension).length.should == 14
    end
  end

end