require 'test_helper'

class TournamentTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Tournament.new.valid?
  end
end
