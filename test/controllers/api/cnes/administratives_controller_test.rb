require 'test_helper'

class Api::Cnes::AdministrativesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
