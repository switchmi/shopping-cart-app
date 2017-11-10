class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @photos = @product.photos.all
  end
end
