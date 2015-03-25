class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, stretches: 20

  has_many :lessons, dependent: :destroy
  has_many :lessons, dependent: :destroy

  self.per_page = 10
end
