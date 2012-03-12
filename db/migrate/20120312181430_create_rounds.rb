class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer   :fight_id
      t.integer   :started_by_roll
      t.integer   :opponent_roll
      
      t.timestamps
    end
  end
end
