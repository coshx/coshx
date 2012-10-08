require 'spec_helper'

describe ApplicationController do
  describe "#catch_exceptions" do
    context "not in production" do
      it "rescues a 505" do
        @controller.send(:catch_exceptions) {raise "HELL"}
        expect { @controller.send(:catch_exceptions) }.should raise_error
      end
    end

    context "in production" do
      before(:each) do
        Rails.stub_chain(:env, :production?).and_return(true)
      end

      it "rescues a 505" do
        @controller.send(:catch_exceptions) {raise "HELL"}
        expect { @controller.send(:catch_exceptions) }.should raise_error
      end

      it "renders page not found" do
        @controller.should_receive(:render_page_not_found)
      end
    end
  end
  #subject.render_page_not_found.should == "errors/not_found"
end