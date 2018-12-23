class OrdersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @orders = Order.where("user_id = ?", current_user.id)
  end

  def new
  end

  def show
    @order = Order.find(params[:id])
  end

# POTENTIALLY BAD CODE NOT TO USE - comment out if this doesn't work out, dawg

  def create
  #   # byebug
  #   @product = Product.find(params[:product_id])
  #   @user = current_user
  #   @order = Order.new(product_id: @product.id, user_id: @user.id, total: @product.price)
  #
  #   respond_to do |format|
  #     if @order.save
  #       format.html { redirect_to @product, notice: 'Bird Added to Cart' }
  #       format.json { render :show, status: :created, location: @product }
  #     else
  #       format.html {redirect_to products_path, alert: 'Bird not added to cart' }
  #       format.json { render json: @order.errors, status: :unprocessable_entity }
  #     end
  #   end
  end

# END BAD CODE

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    respond_to do |format|
      format.html { redirect_to "/orders", notice: 'Bird removed from cart, bird is sad.' }
      format.json { head :no_content }
    end
  end



end
