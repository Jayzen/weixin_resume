class ProductLikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product
  before_action :set_product_like, only: [:destroy, :delete]
  access product: :all, message: "当前用户无权访问"

  def index
    @product_likes = @product.product_likes.includes(:guest).order(created_at: :desc).page(params[:page])
  end

  def delete
  end

  def destroy
    @product_like.destroy
    flash[:success] = "删除成功"
    redirect_to product_product_likes_path(@product)
  end 

  private
    def set_product
      @product = current_user.products.find(params[:product_id])
    end

    def set_product_like
      @product_like = @product.product_likes.find(params[:id])
    end
end
