class FightPlayer < ActiveRecord::Base
  belongs_to  :fight
  belongs_to  :player, :foreign_key => "player1_id"
  belongs_to  :player2, :foreign_key => "player2_id"
end
