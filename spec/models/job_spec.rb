require 'spec_helper'

describe Job do

  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :description }
    context "requires a persisted model" do
      before(:each) { create :job }
      it { should validate_uniqueness_of(:title).case_insensitive }
    end
  end

  describe "#to_param" do
    it "returns the title downcased" do
      subject.title = 'Hello'
      subject.to_param.should == 'hello'
    end

    it "replaces spaces with underscore" do
      subject.title = 'hello world'
      subject.to_param.should == 'hello_world'
    end
  end
end
