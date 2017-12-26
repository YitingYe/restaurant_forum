class Admin::RestaurantsController < ApplicationController
  before_action :authenticate_user! #Devise提供的方法，檢查使用者是否登入
  before_action :authenticate_admin #手工定義的方法，檢查使用者是否為管理者

  def index
    @restaurants = Restaurant.all
  end
end
