class UpdatePlayersId < ActiveRecord::Migration
  def up
    change_column :players, :id, :integer, :limit => 8
  end
end