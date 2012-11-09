require "spec_helper"

describe MessageMailer do
  describe "send_message" do
    let(:mail) { MessageMailer.send_message(FactoryGirl.create(:message)) }

    it "renders the headers" do
      mail.subject.should eq("Here's a new message from the website...")
      mail.to.should eq(["info@coshx.com"])
   end

    it "renders the body" do
      mail.body.encoded.should match("There's a message from")
    end
  end

end
