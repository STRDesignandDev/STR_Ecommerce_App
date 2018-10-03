class SimplePagesController < ApplicationController
  def landing_page
    @featured_product = Product.first
    @products = Product.all
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
