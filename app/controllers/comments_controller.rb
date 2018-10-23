class CommentsController < ApplicationController
before_action :authenticate_user!, except: [:show, :index]
load_and_authorize_resource

  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @product, notice: 'Bird review submitted!' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { redirect_to @product, alert: 'Bird comment and bird score required.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @comment = Comment.find(params[:id])
    product = @comment.product
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to product, notice: 'Bird review successfully removed.' }
      format.json { head :no_content }
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:user_id, :body, :rating)
  end

end
