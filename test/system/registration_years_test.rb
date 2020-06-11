require "application_system_test_case"

class RegistrationYearsTest < ApplicationSystemTestCase
  setup do
    @registration_year = registration_years(:one)
  end

  test "visiting the index" do
    visit registration_years_url
    assert_selector "h1", text: "Registration Years"
  end

  test "creating a Registration year" do
    visit registration_years_url
    click_on "New Registration Year"

    fill_in "Name", with: @registration_year.name
    click_on "Create Registration year"

    assert_text "Registration year was successfully created"
    click_on "Back"
  end

  test "updating a Registration year" do
    visit registration_years_url
    click_on "Edit", match: :first

    fill_in "Name", with: @registration_year.name
    click_on "Update Registration year"

    assert_text "Registration year was successfully updated"
    click_on "Back"
  end

  test "destroying a Registration year" do
    visit registration_years_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Registration year was successfully destroyed"
  end
end
