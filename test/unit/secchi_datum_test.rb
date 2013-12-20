require 'test_helper'

class SecchiDatumTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert SecchiDatum.new.valid?
  end
end
