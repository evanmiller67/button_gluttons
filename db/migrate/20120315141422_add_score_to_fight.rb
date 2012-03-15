class AddScoreToFight < ActiveRecord::Migration
  def change
    add_column  :fights, :started_by_roll, :integer, :default => 0
    add_column  :fights, :opponent_roll,   :integer, :default => 0
  end
end
