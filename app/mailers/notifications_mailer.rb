class NotificationsMailer < ActionMailer::Base
  default from: "leonardo311@gmail.com"
  default to: "leonardo311@gmail.com"

  def new_message(message)
  	@message = message
  	mail(:subject => "[carry.tld] #{message.nombre}")
  end
end
