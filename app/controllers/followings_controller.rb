class FollowingsController < ApplicationController

  def show
    @title = "Following"
    @user  = User.find params[:user_id]
    @followings = @user.following.paginate page: params[:page]
  end
end