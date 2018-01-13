class Admin::BaseController < ApplicationController
    before_action :authenticate_admin #手工定義的方法，檢查使用者是否為管理者
end