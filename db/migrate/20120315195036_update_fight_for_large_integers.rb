class UpdateFightForLargeIntegers < ActiveRecord::Migration
  def up
    if RAILS_ENV == 'production'
      change_column :fights, :started_by_id,  :integer, :limit => 8
      change_column :fights, :opponent_id,    :integer, :limit => 8
    end
  end
end
