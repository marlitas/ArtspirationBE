class LikedArt < ApplicationRecord
  belongs_to :user
  belongs_to :art
end
