class MessageMailer < ActionMailer::Base
  default to: "info@coshx.com"
  default subject: "Here's a new message from the website..."

  def send_message(message)
    @message = message

    mail from: message.email
  end
end
