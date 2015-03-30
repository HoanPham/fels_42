class UsersController < ApplicationController
  before_action :user_signed_in?, only: [:following, :followers]

  def index
    @users = User.paginate page: params[:page]
  end
  
  def show
    @user = User.find params[:id]
  end
end
