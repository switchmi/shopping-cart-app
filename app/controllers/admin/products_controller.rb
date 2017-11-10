class Admin::ProductsController < AdminController
  def new
    @category = Category.find_by(name: params[:category_name])
    @product = @category.products.new
  end

  def create
    @category = Category.find_by(name: params[:category_name])
    @product = @category.products.new(get_params)
    if @product.save
      redirect_to admin_category_path(@category.name)
    else
      render :new
    end
  end

  def destroy
    @category = Category.find_by(name: params[:category_name])
    @product = @category.products.find(params[:id])
    @product.destroy
    redirect_to admin_category_path(@category.name)

  end

  def show
    @category = Category.find_by(name: params[:category_name])
    @product = @category.products.find(params[:id])
    @photos = @product.photos.all
    @photo = @photos.new

  end

  private

  def get_params
    params.require(:product).permit(:name, :description, :feature, :price, :stock)
  end


end
