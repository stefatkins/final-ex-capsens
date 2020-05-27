require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item = items(:default)
    @aged_brie_item = items(:aged_brie)
    @backstage_item = items(:backstage)
    @sulfuras_item = items(:sulfuras)
    @conjured_item = items(:conjured)
  end

  test "should get index" do
    get items_url
    assert_response :success
  end

  test "should get new" do
    get new_item_url
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post items_url, params: { item: { name: @item.name, quality: @item.quality, sell_in: @item.sell_in } }
    end

    assert_redirected_to item_url(Item.last)
  end

  test "should show item" do
    get item_url(@item)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_url(@item)
    assert_response :success
  end

  test "should update item" do
    patch item_url(@item), params: { item: { name: @item.name, quality: @item.quality, sell_in: @item.sell_in } }
    assert_redirected_to item_url(@item)
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete item_url(@item)
    end

    assert_redirected_to items_url
  end

  # Items

  test "should decrease item sellin by 1" do
    assert_difference ->{ @item.reload.sell_in }, -1 do
      get next_day_items_url
    end
  end

  
  test "should decrease item quality by 1" do
    assert_difference ->{ @item.reload.quality }, -1 do
      get next_day_items_url
    end
  end

   test "should decrease item quality by 2 when sell is < 0" do
    @item.update!(sell_in: -1, quality: 10)
    assert_difference ->{ @item.reload.quality }, -2 do
      get next_day_items_url
    end
  end


  # aged_brie_item

  test "should increase aged brie item quality by 1" do
    assert_difference ->{ @aged_brie_item.reload.quality }, 1 do
      get next_day_items_url
    end
  end

  test "should not increase aged brie item quality when quality is over 50" do
    @aged_brie_item.update!(quality: 50)
    assert_difference ->{ @aged_brie_item.reload.quality }, 0 do
      get next_day_items_url
    end
  end

  # # backstage_item

  test "should increase backstage item quality by 1 when sell in is greater than 10" do
    @backstage_item.update!(sell_in: 11)
    assert_difference ->{ @backstage_item.reload.quality }, 1 do
      get next_day_items_url
    end
  end

  test "should increase backstage item quality by 2 when sell in is lesser or equal to 10" do
    @backstage_item.update!(sell_in: 10)
    assert_difference ->{ @backstage_item.reload.quality }, 2 do
      get next_day_items_url
    end
  end

  test "should increase backstage item quality by 3 when sell in is lesser or equal to 5" do
    @backstage_item.update!(sell_in: 5)
    assert_difference ->{ @backstage_item.reload.quality }, 3 do
      get next_day_items_url
    end
  end

  test "should set backstage item quality to O when sell_in is lesser or equal to 0" do
    @backstage_item.update!(sell_in: 0, quality: 10)
    get next_day_items_url
    assert_equal @backstage_item.reload.quality, 0
  end

  # sulfuras_item

   test "should not decrease sulfuras item quality" do
    assert_difference ->{ @sulfuras_item.reload.quality }, 0 do
      get next_day_items_url
    end
  end

   test "should not decrease sulfuras item sell in" do
    assert_difference ->{ @sulfuras_item.reload.sell_in }, 0 do
      get next_day_items_url
    end
  end

  # conjured_item

   test "should decrease conjured quality by 2" do
    assert_difference ->{ @conjured_item.reload.quality }, -2 do
      get next_day_items_url
    end
  end

end
