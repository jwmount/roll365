require "application_system_test_case"

class RequirementsTest < ApplicationSystemTestCase
  setup do
    @requirement = requirements(:one)
  end

  test "visiting the index" do
    visit requirements_url
    assert_selector "h1", text: "Requirements"
  end

  test "creating a Requirement" do
    visit requirements_url
    click_on "New Requirement"

    fill_in "Certificate", with: @requirement.certificate_id
    fill_in "Description", with: @requirement.description
    fill_in "For company", with: @requirement.for_company
    fill_in "For location", with: @requirement.for_location
    fill_in "For person", with: @requirement.for_person
    fill_in "Preference", with: @requirement.preference
    fill_in "Require", with: @requirement.require_id
    fill_in "Require type", with: @requirement.require_type
    click_on "Create Requirement"

    assert_text "Requirement was successfully created"
    click_on "Back"
  end

  test "updating a Requirement" do
    visit requirements_url
    click_on "Edit", match: :first

    fill_in "Certificate", with: @requirement.certificate_id
    fill_in "Description", with: @requirement.description
    fill_in "For company", with: @requirement.for_company
    fill_in "For location", with: @requirement.for_location
    fill_in "For person", with: @requirement.for_person
    fill_in "Preference", with: @requirement.preference
    fill_in "Require", with: @requirement.require_id
    fill_in "Require type", with: @requirement.require_type
    click_on "Update Requirement"

    assert_text "Requirement was successfully updated"
    click_on "Back"
  end

  test "destroying a Requirement" do
    visit requirements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Requirement was successfully destroyed"
  end
end
