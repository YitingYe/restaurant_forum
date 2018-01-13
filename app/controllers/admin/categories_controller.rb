class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user! #Devise提供的方法，檢查使用者是否登入
  before_action :authenticate_admin #手工定義的方法，檢查使用者是否為管理者
  before_action :set_category, only: [:update, :destroy]

  def index
    @categories = Category.all

    if params[:id]
      set_category
    else
      @category = Category.new
    end
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "category was successfully created"
      redirect_to admin_categories_path
    else
      @categories = Category.all
      render :index
    end
  end

  def update
    if @category.update(category_params)
      redirect_to admin_categories_path
      flash[:notice] = "category was successfully update"
    else
      @categories = Category.all
      render :index
    end
  end

  def destroy
    @category.destroy
    flash[:alert] = "category was successfully deleted"
    redirect_to admin_categories_path
  end



  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
