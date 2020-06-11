require "application_system_test_case"

class CarCostsTest < ApplicationSystemTestCase
  setup do
    @car_cost = car_costs(:one)
  end

  test "visiting the index" do
    visit car_costs_url
    assert_selector "h1", text: "Car Costs"
  end

  test "creating a Car cost" do
    visit car_costs_url
    click_on "New Car Cost"

    click_on "Create Car cost"

    assert_text "Car cost was successfully created"
    click_on "Back"
  end

  test "updating a Car cost" do
    visit car_costs_url
    click_on "Edit", match: :first

    click_on "Update Car cost"

    assert_text "Car cost was successfully updated"
    click_on "Back"
  end

  test "destroying a Car cost" do
    visit car_costs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Car cost was successfully destroyed"
  end
end
