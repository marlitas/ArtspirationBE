class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :rated_arts
  has_many :arts, through: :rated_arts
end
