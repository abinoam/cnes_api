require 'test_helper'

class Api::Cnes::HealthUnitiesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
