class ArtCategory < ApplicationRecord
  validates :category_id, presence: true
  validates :category, presence: true
  validates :art_id, presence: true
  validates :art, presence: true
  validates :score, presence: true

  belongs_to :category
  belongs_to :art
end
