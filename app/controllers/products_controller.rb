class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @photos = @product.photos.all
  end

  def search
    @products = Product.search(params[:search_param]) #search method starts here

    if @products #if product is found
      render 'search'
    else
      redirect_to root_path
    end
  end
end
