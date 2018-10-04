class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @orders = Order.includes(:product).all
  end

  def new
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
  end

  def destroy

    respond_to do |format|
      format.html { redirect_to "/products", notice: 'Order removed from cart.' }
      format.json { head :no_content }
    end
  end

end
