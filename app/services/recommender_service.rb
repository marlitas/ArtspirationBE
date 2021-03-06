require './lib/modules/recommendable'
class RecommenderService
  extend Recommendable
  #is called every time there is a change in rating, new / updated
  # def self.update_recommender_data(new_rating)
  #   cached_data = Rails.cache.fetch('recommender_data')
  #   cached_data == nil ?  rec_data = [] : rec_data = cached_data
  #   rec_data << {user_id: new_rating.user_id, item_id: new_rating.art_id, rating: new_rating.liked == true ? 5 : 1}
  #   Rails.cache.write("recommender_data", rec_data)
  # end
  #
  # def self.update_recommender
  #   data = Rails.cache.fetch('recommender_data')
  #   bin = File.binread("recommender.bin")
  #   if bin.empty?
  #     recommender = nil
  #   else
  #     recommender = Marshal.load(bin)
  #   end
  #   recommender == nil ? recommender = Disco::Recommender.new : nil
  #   recommender.fit(data)
  #   bin = Marshal.dump(recommender)
  #   File.binwrite("recommender.bin", bin)
  # end

  # def self.recommend(user_id)
  #   bin = File.binread("recommender.bin")
  #   recommender = Marshal.load(bin)
  #   recommender.user_recs(user_id)
  # end

  def self.recommend_art(user_id, num)
    user = User.find(user_id)
    if user.rated_arts.length < 4
      Art.all.sample(num)
    else
      recommend(user_id, num)
    end
  end
end
