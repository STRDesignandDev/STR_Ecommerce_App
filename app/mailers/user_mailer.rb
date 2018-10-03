class UserMailer < ApplicationMailer
    default from: "from@example.com"

    layout "mailer"

  def contact_form(email, name, message)
  @message = message
    mail(from: email,
         to: 'str.designanddev@gmail.com@gmail.com',
         subject: "A new contact form message from #{name}")
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @message).deliver_now
  end

end