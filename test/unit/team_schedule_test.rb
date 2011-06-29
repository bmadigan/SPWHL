require 'test_helper'

class TeamScheduleTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert TeamSchedule.new.valid?
  end
end
