class Fight < ActiveRecord::Base
  belongs_to  :started_by, :class_name => "Player"
  belongs_to  :opponent,   :class_name => "Player"
  has_many    :rounds

  attr_accessible :started_by, :opponent, :started_by_roll, :opponent_roll

  class << self
    def active;     where(:active => true); end
    def inactive;   where(:active => false); end
  end

  def winner
    if started_by_roll > opponent_roll
      started_by
    elsif opponent_roll > started_by_roll
      opponent
    end
  end

  def score(player)
    "%02d" % (started_by_id == player.id ? started_by_roll : opponent_roll)
  end


end
