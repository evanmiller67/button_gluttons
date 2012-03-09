require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  should validate_presence_of :first_name
  should validate_presence_of :last_name
  should validate_presence_of :email_address
  should validate_uniqueness_of :email_address

  should allow_mass_assignment_of :first_name
  should allow_mass_assignment_of :last_name
  should allow_mass_assignment_of :email_address

  should_not allow_mass_assignment_of :is_boss
  should_not allow_mass_assignment_of :is_registered
  should_not allow_mass_assignment_of :active

  should have_many :fights
end
