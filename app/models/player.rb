class Player < ActiveRecord::Base
  has_many :fights, :foreign_key => "started_by"

  # Only allow these attributes to be mass assgined
  attr_accessible :first_name, :last_name, :email_address

  validates_presence_of :first_name, :last_name, :email_address
  validates :email_address, :uniqueness => true

  default_scope where(:active => true)
  class << self
    def active;     where(:active => true); end
    def registered; where(:is_registered => true); end
    def winners;    where(:is_boss => false).registered.order("wins desc").limit(5); end
    def bosses;     where(:is_boss => true).registered.order("wins desc").limit(5); end
    # def fights; joins(:fights); end
    # def opponents; where(:ajfljkajsfasjflj); end
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
