class Category < ApplicationRecord
  validates :name, presence: true
  
  has_many :art_categories
  has_many :arts, through: :art_categories
end
