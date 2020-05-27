module ItemsHelper

  def decorate_item(item)
    item.extends(Items::DrunkModeDecorator)
  end
end
