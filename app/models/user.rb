class User < ApplicationRecord
  has_many :rated_arts
  has_many :arts, through: :rated_arts
end
