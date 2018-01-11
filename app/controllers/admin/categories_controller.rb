class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user! #Devise提供的方法，檢查使用者是否登入
  before_action :authenticate_admin #手工定義的方法，檢查使用者是否為管理者

  def index
    @categories = Category.all
    @category = Category.new
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

  def category_params
    params.require(:category).permit(:name)
end
