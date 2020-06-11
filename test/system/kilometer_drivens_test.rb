require "application_system_test_case"

class KilometerDrivensTest < ApplicationSystemTestCase
  setup do
    @kilometer_driven = kilometer_drivens(:one)
  end

  test "visiting the index" do
    visit kilometer_drivens_url
    assert_selector "h1", text: "Kilometer Drivens"
  end

  test "creating a Kilometer driven" do
    visit kilometer_drivens_url
    click_on "New Kilometer Driven"

    fill_in "Name", with: @kilometer_driven.name
    click_on "Create Kilometer driven"

    assert_text "Kilometer driven was successfully created"
    click_on "Back"
  end

  test "updating a Kilometer driven" do
    visit kilometer_drivens_url
    click_on "Edit", match: :first

    fill_in "Name", with: @kilometer_driven.name
    click_on "Update Kilometer driven"

    assert_text "Kilometer driven was successfully updated"
    click_on "Back"
  end

  test "destroying a Kilometer driven" do
    visit kilometer_drivens_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Kilometer driven was successfully destroyed"
  end
end
