require 'test_helper'

class Api::V1::HomeControllerTest < ActionController::TestCase
  test 'should get home' do
    get :index
    assert_response :ok
    body = JSON.parse(response.body)
    assert_equal 'Starter page for ToppyShare API', body['info']

  end
end
