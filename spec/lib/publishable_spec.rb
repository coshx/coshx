require 'spec_helper'

describe Publishable do
  before :each do
    class Tester; attr_accessor :posted_on; end
    @object = Tester.new
    @object.extend Publishable
  end

  it "sets posted_on to the current date/time" do
    Timecop.freeze(DateTime.now) do
      @object.publish
      @object.posted_on.should == Time.now
    end
  end

  it "sets published? to true" do
    @object.publish
    @object.published?.should be_true
  end


  it "does nothing on subsequent calls" do
    date = DateTime.parse("2008-01-01")
    Timecop.freeze(date) do
      @object.publish
    end
    @object.publish
    @object.posted_on.should == date
  end
end