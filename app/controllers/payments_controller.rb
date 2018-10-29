class PaymentsController < ApplicationController

    def create
      @product = Product.find(params[:product_id])
      @user = current_user
      token = params[:stripeToken]
      # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        amount:  (@product.price * 1).to_i, # amount in cents, again
        currency: "usd",
        source: token,
        description: params[:stripeEmail]
      )
      if charge.paid
        Order.create(
         product_id: @product.id,
         user_id: @user.id,
         total: @product.price
        )
        respond_to do |format|
          format.html { redirect_to "/orders", notice: 'Did you seriously buy a bird! That is crazy, hahahaha!' }
          format.json { head :no_content }
        end
      end

    rescue Stripe::CardError => e
    # The card has been declined
    body = e.json_body
    err = body[:error]
    flash[:error] = "Unfortunately, something is up with your card. No bird for you, try again: #{err[:message]}"
  end

  end
end
