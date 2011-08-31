require 'test_helper'

class MediafileTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Mediafile.new.valid?
  end
end
