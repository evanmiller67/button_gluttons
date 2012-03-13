class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :email_address
      t.boolean :is_boss,       :default => false
      t.boolean :is_registered, :default => false

      t.boolean :active,        :default => true
      t.timestamps
    end
  end
end
