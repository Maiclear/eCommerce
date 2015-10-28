class ProductsController < ApplicationController
  load_and_authorize_resource
  before_action :set_product, only: [:show]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @reviews = @product.reviews.reverse
  end

  # GET /products/new
  # def new
  #   @product = Product.new
  # end

  # GET /products/1/edit
  # def edit
  # end

  # POST /products
  # POST /products.json
  # def create
  #   @product = Product.new(product_params)
  #   @product.user = current_user if user_signed_in?

  #   respond_to do |format|
  #     if @product.save
  #       format.html { redirect_to @product, notice: 'Product was successfully created.' }
  #       format.json { render :show, status: :created, location: @product }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @product.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /products/1
  # # PATCH/PUT /products/1.json
  # def update
  #   respond_to do |format|
  #     if @product.update(product_params)
  #       format.html { redirect_to @product, notice: 'Product was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @product }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @product.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /products/1
  # # DELETE /products/1.json
  # def destroy
  #   @product.destroy
  #   respond_to do |format|
  #     format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  def like
    @like = @product.likes.build(user: current_user)

    if @product.liked_by? current_user
      @product.remove_like current_user
      redirect_to @product, notice: 'Tu like a sido eliminado :('
    elsif @product.save
      redirect_to @product, notice: 'Gracias por tu like :D'
    else
      redirect_to @product, notice: 'Tu like no se ha guardado :('
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :price, :stock, :category_id, :image, :image_cache)
    end
end
