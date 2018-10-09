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

  def create
    @order = Order.new(order_params)
    @order.create
    respond_to do |format|
      format.html { redirect_to "/products", notice: 'Order added to cart.' }
      format.json { head :no_content }
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    respond_to do |format|
      format.html { redirect_to "/orders", notice: 'Order removed from cart.' }
      format.json { head :no_content }
    end
  end


end
