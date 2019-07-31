class ProductCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product
  before_action :set_product_comment, only: [:destroy, :delete]
  access product: :all, message: "当前用户无权访问"

  def index
    @product_comments = @product.product_comments.includes(:guest).order(created_at: :desc).page(params[:page])
  end

  def delete
  end

  def destroy
    @product_comment.destroy
    flash[:success] = "删除成功"
    redirect_to product_product_comments_path(@product)
  end 

  private
    def set_product
      @product = current_user.products.find(params[:product_id])
    end

    def set_product_comment
      @product_comment = @product.product_comments.find(params[:id])
    end
end
