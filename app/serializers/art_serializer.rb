class ArtSerializer
  include FastJsonapi::ObjectSerializer
  attributes :artsy_id

  def self.rated_art(liked_arts, user)
    {data:
      liked_arts.map do |liked_art|
        data = ArtsyFacade.find_art_by_id(liked_art.art.artsy_id)
        {id: liked_art.art_id,
        type: 'rated_art',
        attributes: {
          title: data[:title],
          image: data[:_links][:image][:href],
          liked: liked_art.liked,
          user_id: user.id
          }
        }
      end
    }
  end

  def self.art_show(art_data, art)
    # x = 'unrated'
    # z = if rated_art.liked == nil ? x : rated_art.liked
    {data:
      {
        id: art.id,
        type: 'rated_art',
        attributes: {
          title: art_data[:title],
          image: art_data[:_links][:image][:href],
          liked: art.liked,
          user_id: art.user_id
        }
      }
    }
  end

  def self.unliked_art_show(art_data, art, user)
    {data:
      {
        id: art.id,
        type: 'rated_art',
        attributes: {
          title: art_data[:title],
          image: art_data[:_links][:image][:href],
          liked: 'unrated',
          user_id: user.id
        }
      }
    }
  end
end
