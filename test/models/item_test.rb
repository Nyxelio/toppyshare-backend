require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test 'should not add item without title' do
    item = Item.new
    assert_not item.save
  end
end
