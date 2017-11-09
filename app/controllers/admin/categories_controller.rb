class Admin::CategoriesController < AdminController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(get_params)
    if @category.save
      redirect_to new_admin_category_path
    else
      render :new
    end
  end

  def show
    @category = Category.find_by(name: params[:name])
    @products = @category.products
  end

  private

  def get_params
    params.require(:category).permit(:name, :description)
  end


end
