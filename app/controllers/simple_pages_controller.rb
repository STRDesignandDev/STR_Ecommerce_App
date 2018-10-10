class SimplePagesController < ApplicationController
  def index
    @products = Product.limit(3).order("RANDOM()")
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    ActionMailer::Base.mail(from: @email,
        to: 'str.designanddev@gmail.com',
        subject: "#{@name} has a question or comment",
        body: @message).deliver_now
    end
end
