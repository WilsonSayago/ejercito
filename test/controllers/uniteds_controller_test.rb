require 'test_helper'

class UnitedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @united = uniteds(:one)
  end

  test "should get index" do
    get uniteds_url
    assert_response :success
  end

  test "should get new" do
    get new_united_url
    assert_response :success
  end

  test "should create united" do
    assert_difference('United.count') do
      post uniteds_url, params: { united: { name: @united.name, points: @united.points } }
    end

    assert_redirected_to united_url(United.last)
  end

  test "should show united" do
    get united_url(@united)
    assert_response :success
  end

  test "should get edit" do
    get edit_united_url(@united)
    assert_response :success
  end

  test "should update united" do
    patch united_url(@united), params: { united: { name: @united.name, points: @united.points } }
    assert_redirected_to united_url(@united)
  end

  test "should destroy united" do
    assert_difference('United.count', -1) do
      delete united_url(@united)
    end

    assert_redirected_to uniteds_url
  end
end
