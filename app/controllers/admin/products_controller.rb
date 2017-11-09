class Admin::ProductsController < AdminController
  def new
    @category = Category.find_by(name: params[:category_name])
    @product = @category.products.new
  end

  def create
    @category = Category.find_by(name: params[:category_name])
    @product = @category.products.new(get_params)
    if @product.save
      redirect_to admin_category_path(@category)
    else
      render :new
    end
  end

  private

  def get_params
    params.require(:product).permit(:name, :description, :feature, :price, :stock)
  end


end
