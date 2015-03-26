class Lesson < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :lesson_words

  accepts_nested_attributes_for :lesson_words

  before_save :count_correct_answer

  private
    
    def count_correct_answer
      no_correct_answers = self.lesson_words.select{|result| result.answer == result.word.answers.find_by(is_right: true)}.count
      self.correct_answers = no_correct_answers
    end
end
