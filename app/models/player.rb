class Player < ActiveRecord::Base
  has_many :fights, :foreign_key => :started_by

  # Only allow these attributes to be mass assgined
  attr_accessible :first_name, :last_name, :email_address

  validates_presence_of :first_name, :last_name, :email_address
  validates :email_address, :uniqueness => true

  default_scope where(:active => true)
  class << self
    def active;     where(:active => true); end
    def registered; where(:is_registered => true); end
  end
end
