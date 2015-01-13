require 'spec_helper'

describe ApplicationController do
  describe "#catch_exceptions" do
    context "in production" do
      before(:each) do
        @controller = ApplicationController.new
        Rails.stub_chain(:env, :production?).and_return(true)
      end

      it "rescues a 505" do
        @controller.should_receive(:render_error)
        @controller.send(:catch_exceptions) {raise "exception"}
      end

      it "renders page not found" do
        @controller.should_receive(:render_page_not_found)
        @controller.send(:catch_exceptions) {raise ActiveRecord::RecordNotFound}
      end
    end
  end
end