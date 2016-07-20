require 'test_helper'

class Api::Cnes::TeachingActivitiesControllerTest < ActionController::TestCase
  setup do
    @api_cnes_teaching_activity = api_cnes_teaching_activities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:api_cnes_teaching_activities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create api_cnes_teaching_activity" do
    assert_difference('Api::Cnes::TeachingActivity.count') do
      post :create, api_cnes_teaching_activity: { activity: @api_cnes_teaching_activity.activity }
    end

    assert_redirected_to api_cnes_teaching_activity_path(assigns(:api_cnes_teaching_activity))
  end

  test "should show api_cnes_teaching_activity" do
    get :show, id: @api_cnes_teaching_activity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @api_cnes_teaching_activity
    assert_response :success
  end

  test "should update api_cnes_teaching_activity" do
    patch :update, id: @api_cnes_teaching_activity, api_cnes_teaching_activity: { activity: @api_cnes_teaching_activity.activity }
    assert_redirected_to api_cnes_teaching_activity_path(assigns(:api_cnes_teaching_activity))
  end

  test "should destroy api_cnes_teaching_activity" do
    assert_difference('Api::Cnes::TeachingActivity.count', -1) do
      delete :destroy, id: @api_cnes_teaching_activity
    end

    assert_redirected_to api_cnes_teaching_activities_path
  end
end
