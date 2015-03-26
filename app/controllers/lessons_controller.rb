class LessonsController < ApplicationController
  respond_to :js, :json, :html
  def new
    @category = Category.find params[:category_id]
    @lesson = @category.lessons.build user_id: current_user.id
    words = @category.words.random_words current_user
    20.times do |n|
      @record = @lesson.lesson_words.build
      @record.word = words[n]
    end
  end

  def create
    @category = Category.find params[:category_id]
    @lesson = @category.lessons.build lesson_params
    @lesson.user_id = current_user.id
    if @lesson.save
      redirect_to category_lesson_path(@category, @lesson)
    else
      render 'new'
    end
  end
  
  def show
    @category = Category.find params[:category_id]
    @lesson = Lesson.find params[:id]         
  end

  private

    def lesson_params
      params.require(:lesson).permit lesson_words_attributes: [:id, :word_id, :answer_id]
    end
end
