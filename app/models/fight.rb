class Fight < ActiveRecord::Base
  belongs_to  :started_by, :class_name => "Player"
  belongs_to  :opponent,   :class_name => "Player"
  has_many    :rounds

  attr_accessible :started_by, :opponent, :started_by_roll, :opponent_roll

  default_scope where(:active => true)

  class << self
    def active;     where(:active => true); end
    def inactive;   where(:active => false); end
  end

end
