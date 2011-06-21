require 'test_helper'

class RosterTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Roster.new.valid?
  end
end
