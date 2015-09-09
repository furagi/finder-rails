require 'test_helper'

class GirlTest < ActiveSupport::TestCase

  test "should not save Girl without name" do
    girl = Girl.new
    assert_not girl.save
  end

  test "should not save Girl if main_photo_id do not belongs to self" do
    girl = Girl.new
    girl.main_photo_id = 1
    assert_not girl.save
  end

end
