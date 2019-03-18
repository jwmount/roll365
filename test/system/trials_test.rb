require "application_system_test_case"

class TrialsTest < ApplicationSystemTestCase
  setup do
    @trial = trials(:one)
  end

  test "visiting the index" do
    visit trials_url
    assert_selector "h1", text: "Trials"
  end

  test "creating a Trial" do
    visit trials_url
    click_on "New Trial"

    fill_in "Company", with: @trial.company_id
    fill_in "Company type", with: @trial.company_type
    fill_in "Description", with: @trial.description
    fill_in "Name", with: @trial.name
    fill_in "Person", with: @trial.person_id
    fill_in "Person type", with: @trial.person_type
    fill_in "Trialable", with: @trial.trialable_id
    fill_in "Trialable type", with: @trial.trialable_type
    click_on "Create Trial"

    assert_text "Trial was successfully created"
    click_on "Back"
  end

  test "updating a Trial" do
    visit trials_url
    click_on "Edit", match: :first

    fill_in "Company", with: @trial.company_id
    fill_in "Company type", with: @trial.company_type
    fill_in "Description", with: @trial.description
    fill_in "Name", with: @trial.name
    fill_in "Person", with: @trial.person_id
    fill_in "Person type", with: @trial.person_type
    fill_in "Trialable", with: @trial.trialable_id
    fill_in "Trialable type", with: @trial.trialable_type
    click_on "Update Trial"

    assert_text "Trial was successfully updated"
    click_on "Back"
  end

  test "destroying a Trial" do
    visit trials_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Trial was successfully destroyed"
  end
end
