class Art < ApplicationRecord
  has_many :rated_arts
  has_many :users, through: :rated_arts
  has_many :art_categories
  has_many :categories, through: :art_categories

  def self.serialize_art(arts, type)
    artworks = []
    user_id = arts[0].user_id
    arts.each do |art|
      art_data = ArtsyFacade.find_art_by_id(art.art.artsy_id)
      serialized_hash = {}
      serialized_hash[:id] = art.art_id
      serialized_hash[:type] = type
      attrs = {}
      attrs[:title] = art_data[:title]
      attrs[:image] = art_data[:_links][:image][:href]
      attrs[:user_id] = user_id
      serialized_hash[:attributes] = attrs
      artworks << serialized_hash
    end
    {data: artworks}.to_json
  end
end
