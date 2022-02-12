class Art < ApplicationRecord
  has_many :rated_arts
  has_many :users, through: :rated_arts
  has_many :art_categories
  has_many :categories, through: :art_categories
end
