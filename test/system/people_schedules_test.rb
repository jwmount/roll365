require "application_system_test_case"

class PeopleSchedulesTest < ApplicationSystemTestCase
  setup do
    @people_schedule = people_schedules(:one)
  end

  test "visiting the index" do
    visit people_schedules_url
    assert_selector "h1", text: "People Schedules"
  end

  test "creating a People schedule" do
    visit people_schedules_url
    click_on "New People Schedule"

    fill_in "Person", with: @people_schedule.person_id
    fill_in "Schedule", with: @people_schedule.schedule_id
    click_on "Create People schedule"

    assert_text "People schedule was successfully created"
    click_on "Back"
  end

  test "updating a People schedule" do
    visit people_schedules_url
    click_on "Edit", match: :first

    fill_in "Person", with: @people_schedule.person_id
    fill_in "Schedule", with: @people_schedule.schedule_id
    click_on "Update People schedule"

    assert_text "People schedule was successfully updated"
    click_on "Back"
  end

  test "destroying a People schedule" do
    visit people_schedules_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "People schedule was successfully destroyed"
  end
end
