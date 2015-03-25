class Word < ActiveRecord::Base
  belongs_to :category
  has_many :answers, dependent: :destroy
  has_many :lesson_words

  accepts_nested_attributes_for :answers
  scope :not_learned, -> (user){where("id NOT IN (SELECT word_id FROM lesson_words 
                                WHERE lesson_id IN (SELECT id FROM lessons WHERE user_id = ?))", user.id)}
  scope :random_words, -> (user){Word.not_learned(user).order('RAND()').limit(20)}

  validates :category_id, presence: true
  validates :content, presence: true
end