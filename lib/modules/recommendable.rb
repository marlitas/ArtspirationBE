module Recommendable
  # all categories a user has liked
  def user_liked_categories(user_id)
    user = User.find(user_id)
    user.arts
        .joins(:art_categories)
        .select('art_categories.category_id')
        .where('rated_arts.liked = ?', true)
        .order(:category_id)
  end

  # all categories connected to art pieces
  def art_categories(art_id)
    art = Art.find(art_id)
    art.art_categories
  end

  # user_category hash:  category user has liked -> key, weight -> value
  def user_category_hash(user_id)
    hash = Hash.new(0)
    user_liked_categories(user_id).each do |cat|
      hash[cat.category_id] += 1
    end
    hash
  end

  # art hash : all categories that art has (key), weight (score)
    # any category (all art liked or not) is included in art_hash (value 0 is needed)

end
