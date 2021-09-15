class CreateLikedArts < ActiveRecord::Migration[5.2]
  def change
    create_table :liked_arts do |t|
      t.references :user, foreign_key: true
      t.references :art, foreign_key: true

      t.timestamps
    end
  end
end
