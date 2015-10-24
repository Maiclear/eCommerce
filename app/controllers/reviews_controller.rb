class ReviewsController < ApplicationController
  def index
  end

  def create
    @product = Product.find(params[:product_id])
    @reviews = @product.reviews
    # @review = @product.reviews.build(review_params)
    # @review.user = current_user
    # @review.save

    redirect_to @post
  end


  private

    def review_params
      params.require(:review).permit(:content)
    end
end
