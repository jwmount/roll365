require "application_system_test_case"

class EngagementsTest < ApplicationSystemTestCase
  setup do
    @engagement = engagements(:one)
  end

  test "visiting the index" do
    visit engagements_url
    assert_selector "h1", text: "Engagements"
  end

  test "creating a Engagement" do
    visit engagements_url
    click_on "New Engagement"

    fill_in "Ok tomorrow", with: @engagement.OK_tomorrow
    fill_in "Breakdown", with: @engagement.breakdown
    fill_in "Docket", with: @engagement.docket_id
    fill_in "Docket number", with: @engagement.docket_number
    fill_in "Engagement declined", with: @engagement.engagement_declined
    fill_in "No show", with: @engagement.no_show
    fill_in "Onsite at", with: @engagement.onsite_at
    fill_in "Onsite now", with: @engagement.onsite_now
    fill_in "Person", with: @engagement.person_id
    fill_in "Schedule", with: @engagement.schedule_id
    click_on "Create Engagement"

    assert_text "Engagement was successfully created"
    click_on "Back"
  end

  test "updating a Engagement" do
    visit engagements_url
    click_on "Edit", match: :first

    fill_in "Ok tomorrow", with: @engagement.OK_tomorrow
    fill_in "Breakdown", with: @engagement.breakdown
    fill_in "Docket", with: @engagement.docket_id
    fill_in "Docket number", with: @engagement.docket_number
    fill_in "Engagement declined", with: @engagement.engagement_declined
    fill_in "No show", with: @engagement.no_show
    fill_in "Onsite at", with: @engagement.onsite_at
    fill_in "Onsite now", with: @engagement.onsite_now
    fill_in "Person", with: @engagement.person_id
    fill_in "Schedule", with: @engagement.schedule_id
    click_on "Update Engagement"

    assert_text "Engagement was successfully updated"
    click_on "Back"
  end

  test "destroying a Engagement" do
    visit engagements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Engagement was successfully destroyed"
  end
end
