class CreateArtCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :art_categories do |t|
      t.references :category, foreign_key: true
      t.references :art, foreign_key: true

      t.timestamps
    end
  end
end
