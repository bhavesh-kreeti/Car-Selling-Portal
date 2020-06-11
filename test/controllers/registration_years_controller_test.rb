require 'test_helper'

class RegistrationYearsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @registration_year = registration_years(:one)
  end

  test "should get index" do
    get registration_years_url
    assert_response :success
  end

  test "should get new" do
    get new_registration_year_url
    assert_response :success
  end

  test "should create registration_year" do
    assert_difference('RegistrationYear.count') do
      post registration_years_url, params: { registration_year: { name: @registration_year.name } }
    end

    assert_redirected_to registration_year_url(RegistrationYear.last)
  end

  test "should show registration_year" do
    get registration_year_url(@registration_year)
    assert_response :success
  end

  test "should get edit" do
    get edit_registration_year_url(@registration_year)
    assert_response :success
  end

  test "should update registration_year" do
    patch registration_year_url(@registration_year), params: { registration_year: { name: @registration_year.name } }
    assert_redirected_to registration_year_url(@registration_year)
  end

  test "should destroy registration_year" do
    assert_difference('RegistrationYear.count', -1) do
      delete registration_year_url(@registration_year)
    end

    assert_redirected_to registration_years_url
  end
end
