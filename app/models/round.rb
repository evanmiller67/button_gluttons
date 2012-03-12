class Round < ActiveRecord::Base
  belongs_to  :fight

  attr_accessible :started_by_roll, :opponent_roll
end
