require 'test_helper'

class TopTest < ActiveSupport::TestCase
  test 'should not add top without title' do
    top = Top.new
    assert_not top.save
  end
  test 'should not add top without category' do
    top = Top.new
    assert_not top.save
  end
end
