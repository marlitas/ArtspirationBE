class RatedArt < ApplicationRecord
  validates :liked, inclusion: { in: [true, false] }
  validates :user_id, presence: true
  validates :user, presence: true
  validates :art_id, presence: true
  validates :art, presence: true

  belongs_to :user
  belongs_to :art
end
