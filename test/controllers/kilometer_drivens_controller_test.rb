require 'test_helper'

class KilometerDrivensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kilometer_driven = kilometer_drivens(:one)
  end

  test "should get index" do
    get kilometer_drivens_url
    assert_response :success
  end

  test "should get new" do
    get new_kilometer_driven_url
    assert_response :success
  end

  test "should create kilometer_driven" do
    assert_difference('KilometerDriven.count') do
      post kilometer_drivens_url, params: { kilometer_driven: { name: @kilometer_driven.name } }
    end

    assert_redirected_to kilometer_driven_url(KilometerDriven.last)
  end

  test "should show kilometer_driven" do
    get kilometer_driven_url(@kilometer_driven)
    assert_response :success
  end

  test "should get edit" do
    get edit_kilometer_driven_url(@kilometer_driven)
    assert_response :success
  end

  test "should update kilometer_driven" do
    patch kilometer_driven_url(@kilometer_driven), params: { kilometer_driven: { name: @kilometer_driven.name } }
    assert_redirected_to kilometer_driven_url(@kilometer_driven)
  end

  test "should destroy kilometer_driven" do
    assert_difference('KilometerDriven.count', -1) do
      delete kilometer_driven_url(@kilometer_driven)
    end

    assert_redirected_to kilometer_drivens_url
  end
end
