require 'spec_helper'

describe Publishable do
  before(:all) do
    class Tester
      include Publishable
      attr_accessor :posted_on
    end
  end
  subject { Tester.new }

  describe "#publish" do
    it "sets posted_on to the current date/time" do
      Timecop.freeze(DateTime.now) do
        subject.publish.posted_on.strftime("%D%T").should == Time.now.strftime("%D%T")
      end
    end

    it "sets published? to true" do
      subject.publish.published?.should be_true
    end


    it "does nothing on subsequent calls" do
      date = DateTime.parse("2008-01-01")
      Timecop.freeze(date) do
        subject.publish
      end
      subject.publish.posted_on.should == date
    end
  end

  describe ".published" do
    it "limits results to rows where posted_on is set" do
      Tester.should_receive(:where).with 'posted_on IS NOT NULL'
      Tester.published
    end
  end
end
