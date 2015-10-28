class ReviewsController < ApplicationController
  load_and_authorize_resource
  def index
  end

  def create
    @product = Product.find(params[:product_id])
    @reviews = @product.reviews
    @review.user = current_user if user_signed_in?
    # @review = @product.reviews.build(review_params)
    # @review.user = current_user
    # @review.save

    redirect_to @post
  end

  def like
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    @like = @review.likes.build(user: current_user)

    if @review.liked_by? current_user
       @review.remove_like current_user
       redirect_to @product, notice: 'Tu like a sido eliminado :('
    elsif @like.save
      redirect_to @product, notice: 'Gracias por tu like :D'
    else
      redirect_to @product, notice: 'Tu like no se ha guardado :('
    end
  end

  private

    def review_params
      params.require(:review).permit(:content)
    end
end
