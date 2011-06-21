require 'test_helper'

class ArenaTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Arena.new.valid?
  end
end
