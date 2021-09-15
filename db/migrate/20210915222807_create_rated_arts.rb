class CreateRatedArts < ActiveRecord::Migration[5.2]
  def change
    create_table :rated_arts do |t|
      t.boolean :liked
      t.references :user, foreign_key: true
      t.references :art, foreign_key: true

      t.timestamps
    end
  end
end
