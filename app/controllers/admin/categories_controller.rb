class CategoriesController < ApplicationController
  before_action :admin_user

  def index
    if current_user.admin?
      @category = Category.new
    end
    @categories = Category.paginate page: params[:page]
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Create new category successfully."
    else
      flash[:danger] = "Update category failed!"
    end
    redirect_to request.referrer || root_url
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:success] = "Category updated"
      redirect_to request.referrer || root_url
    else
      redirect_to @category
    end
  end

  def destroy
    Category.find(params[:id]).destroy
    flash[:success] = "Category deleted"
    redirect_to categories_url
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end 

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
