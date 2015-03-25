class Word < ActiveRecord::Base
  belongs_to :category
  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers

  scope :random_words, -> {order('RAND()')}

  validates :category_id, presence: true
  validates :content, presence: true
end
