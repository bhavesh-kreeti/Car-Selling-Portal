require 'test_helper'

class RegistrationStatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @registration_state = registration_states(:one)
  end

  test "should get index" do
    get registration_states_url
    assert_response :success
  end

  test "should get new" do
    get new_registration_state_url
    assert_response :success
  end

  test "should create registration_state" do
    assert_difference('RegistrationState.count') do
      post registration_states_url, params: { registration_state: {  } }
    end

    assert_redirected_to registration_state_url(RegistrationState.last)
  end

  test "should show registration_state" do
    get registration_state_url(@registration_state)
    assert_response :success
  end

  test "should get edit" do
    get edit_registration_state_url(@registration_state)
    assert_response :success
  end

  test "should update registration_state" do
    patch registration_state_url(@registration_state), params: { registration_state: {  } }
    assert_redirected_to registration_state_url(@registration_state)
  end

  test "should destroy registration_state" do
    assert_difference('RegistrationState.count', -1) do
      delete registration_state_url(@registration_state)
    end

    assert_redirected_to registration_states_url
  end
end
