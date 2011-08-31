require 'test_helper'

class StandingsTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Standings.new.valid?
  end
end
