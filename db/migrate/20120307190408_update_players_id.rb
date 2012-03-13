class UpdatePlayersId < ActiveRecord::Migration
  def up
    if RAILS_ENV == 'production'
      change_column :players, :id, :integer, :limit => 8
    end
  end
end