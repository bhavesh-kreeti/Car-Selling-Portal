require 'test_helper'

class CarCostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @car_cost = car_costs(:one)
  end

  test "should get index" do
    get car_costs_url
    assert_response :success
  end

  test "should get new" do
    get new_car_cost_url
    assert_response :success
  end

  test "should create car_cost" do
    assert_difference('CarCost.count') do
      post car_costs_url, params: { car_cost: {  } }
    end

    assert_redirected_to car_cost_url(CarCost.last)
  end

  test "should show car_cost" do
    get car_cost_url(@car_cost)
    assert_response :success
  end

  test "should get edit" do
    get edit_car_cost_url(@car_cost)
    assert_response :success
  end

  test "should update car_cost" do
    patch car_cost_url(@car_cost), params: { car_cost: {  } }
    assert_redirected_to car_cost_url(@car_cost)
  end

  test "should destroy car_cost" do
    assert_difference('CarCost.count', -1) do
      delete car_cost_url(@car_cost)
    end

    assert_redirected_to car_costs_url
  end
end
