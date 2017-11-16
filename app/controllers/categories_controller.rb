class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(name: params[:name])
    @products = @category.products.all
  end
end
