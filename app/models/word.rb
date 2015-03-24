class Word < ActiveRecord::Base
  belongs_to :category
  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers

  validates :category_id, presence: true
  validates :content, presence: true
end
