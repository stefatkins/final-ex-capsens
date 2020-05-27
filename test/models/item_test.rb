require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test "#next_day" do
    @item = items(:default)
    assert_difference ->{ @item.sell_in }, -1 do
      @item.next_day
    end
  end
end
