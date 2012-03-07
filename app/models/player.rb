class Player < ActiveRecord::Base

  default_scope where(:active => true)
  class << self
    def active;     where(:active => true); end
    def registered; where(:is_registered => true); end
  end
end
