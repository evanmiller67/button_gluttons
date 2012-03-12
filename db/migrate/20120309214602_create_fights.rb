class CreateFights < ActiveRecord::Migration
  def change
    create_table :fights do |t|
      t.integer :started_by_id
      t.integer :opponent_id
      t.string  :status, :default => 'i'

      t.boolean :active, :default => true
      t.timestamps
    end
  end
end
