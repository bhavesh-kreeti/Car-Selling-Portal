require "application_system_test_case"

class RegistrationStatesTest < ApplicationSystemTestCase
  setup do
    @registration_state = registration_states(:one)
  end

  test "visiting the index" do
    visit registration_states_url
    assert_selector "h1", text: "Registration States"
  end

  test "creating a Registration state" do
    visit registration_states_url
    click_on "New Registration State"

    click_on "Create Registration state"

    assert_text "Registration state was successfully created"
    click_on "Back"
  end

  test "updating a Registration state" do
    visit registration_states_url
    click_on "Edit", match: :first

    click_on "Update Registration state"

    assert_text "Registration state was successfully updated"
    click_on "Back"
  end

  test "destroying a Registration state" do
    visit registration_states_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Registration state was successfully destroyed"
  end
end
