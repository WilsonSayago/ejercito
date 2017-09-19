require 'test_helper'

class CivilizationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @civilization = civilizations(:one)
  end

  test "should get index" do
    get civilizations_url
    assert_response :success
  end

  test "should get new" do
    get new_civilization_url
    assert_response :success
  end

  test "should create civilization" do
    assert_difference('Civilization.count') do
      post civilizations_url, params: { civilization: { arqueros: @civilization.arqueros, caballero: @civilization.caballero, name: @civilization.name, piqueros: @civilization.piqueros } }
    end

    assert_redirected_to civilization_url(Civilization.last)
  end

  test "should show civilization" do
    get civilization_url(@civilization)
    assert_response :success
  end

  test "should get edit" do
    get edit_civilization_url(@civilization)
    assert_response :success
  end

  test "should update civilization" do
    patch civilization_url(@civilization), params: { civilization: { arqueros: @civilization.arqueros, caballero: @civilization.caballero, name: @civilization.name, piqueros: @civilization.piqueros } }
    assert_redirected_to civilization_url(@civilization)
  end

  test "should destroy civilization" do
    assert_difference('Civilization.count', -1) do
      delete civilization_url(@civilization)
    end

    assert_redirected_to civilizations_url
  end
end
