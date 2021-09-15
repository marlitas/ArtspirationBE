class Art < ApplicationRecord
  has_many :liked_arts
  has_many :users, through: :liked_arts

  has_many :art_categories
  has_many :categories, through: :art_categories
end
