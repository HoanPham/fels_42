class WordsController < ApplicationController

  def index
    @words = Word.all
    @categories = Category.all
  end
end
