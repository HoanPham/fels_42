class StaticPagesController < ApplicationController
  
  def home
    @feed_items = current_user.feed.paginate page: params[:page]
  end
end
