class AddScoreToArtCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :art_categories, :score, :float
  end
end
