class AddDataToGame < ActiveRecord::Migration
  def change
    add_column :games, :data, :binary
  end
end
