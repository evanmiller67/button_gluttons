class CreateFights < ActiveRecord::Migration
  def change
    create_table :fights do |t|
      t.integer :started_by
      t.integer :opponent

      t.boolean :active, :default => true
      t.timestamps
    end
  end
end
