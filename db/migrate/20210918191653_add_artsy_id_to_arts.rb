class AddArtsyIdToArts < ActiveRecord::Migration[5.2]
  def change
    add_column :arts, :artsy_id, :string
  end
end
