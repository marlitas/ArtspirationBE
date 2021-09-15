class User < ApplicationRecord
  has_many :liked_arts
  has_many :arts, through: :liked_arts
end
