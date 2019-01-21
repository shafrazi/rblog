class Admin::CategoriesController < Admin::ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @page_title = "Add new category"
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category created"
      redirect_to admin_categories_path
    else
      render "new"
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = "Category updated"
      redirect_to admin_categories_path
    else
      render "edit"
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = "Category deleted"
    redirect_to admin_categories_path
  end

  private
    def category_params
      params.require(:category).permit(:name)
      #code
    end
end
