class LessonsController < ApplicationController
  def new
    @category = Category.find params[:category_id]
    @lesson = @category.lessons.build user_id: current_user.id
    @words = @category.words.random_words current_user
  end

  def create
  end
end
