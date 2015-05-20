require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should not add user without email' do
    user = User.new
    assert_not user.save
    end
  test 'should not add user without name' do
    user = User.new
    assert_not user.save
  end
end
