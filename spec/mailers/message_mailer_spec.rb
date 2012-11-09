require "spec_helper"

describe MessageMailer do
  describe "send_message" do
    let(:mail) { MessageMailer.send_message }

    it "renders the headers" do
      mail.subject.should eq("Send message")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
