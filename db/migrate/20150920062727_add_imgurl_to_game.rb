class AddImgurlToGame < ActiveRecord::Migration
  def change
    add_column :games, :img_url, :string
  end
end
