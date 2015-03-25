class Category < ActiveRecord::Base
  has_many :words, dependent: :destroy
  validates :name, presence: true
  self.per_page = 5
end
