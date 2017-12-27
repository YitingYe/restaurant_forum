class Admin::RestaurantsController < ApplicationController
  before_action :authenticate_user! #Devise提供的方法，檢查使用者是否登入
  before_action :authenticate_admin #手工定義的方法，檢查使用者是否為管理者

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:notice] = "restaurant was successfully created"
      redirect_to admin_restaurants_path
    else
      flash.now[:alert] = "restaurant was failed to create"
      render :new
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :opening_hours, :tel, :adress, :description)
  end
end
