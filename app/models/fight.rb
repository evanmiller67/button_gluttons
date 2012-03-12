class Fight < ActiveRecord::Base
  belongs_to  :started_by, :class_name => "Player"
  belongs_to  :opponent,   :class_name => "Player"
  has_many    :rounds

  attr_accessible :started_by, :opponent

  class << self
    def active;     where(:active => true); end
    def registered; where(:is_registered => true); end
    # def fights; joins(:fights); end
    # def opponents; where(:ajfljkajsfasjflj); end
  end

end
