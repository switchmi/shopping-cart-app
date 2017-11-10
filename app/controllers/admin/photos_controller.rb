class Admin::PhotosController < AdminController
  def create
    @category = Category.find_by(name: params[:category_name])
    @product = @category.products.find(params[:product_id])
    @photo = @product.photos.new(get_params)
    if @photo.save
      redirect_to admin_category_product_path(@category.name, @product.id)
    else
      redirect_to admin_category_product_path(@category.name, @product.id)
    end
  end

  private
  def get_params
    params.require(:photo).permit(:url)
  end
end
