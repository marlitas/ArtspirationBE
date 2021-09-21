class ArtSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :title, :image
  def image 
    [:_links][:image][:href]
  end
end
