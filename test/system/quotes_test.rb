require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  setup do
    @quote = quotes(:one)
  end

  test "visiting the index" do
    visit quotes_url
    assert_selector "h1", text: "Quotes"
  end

  test "creating a Quote" do
    visit quotes_url
    click_on "New Quote"

    fill_in "Council", with: @quote.council
    fill_in "Duration", with: @quote.duration
    fill_in "Expected start", with: @quote.expected_start
    fill_in "Fire ants", with: @quote.fire_ants
    fill_in "Fire ants verified by", with: @quote.fire_ants_verified_by
    fill_in "Inclusions", with: @quote.inclusions
    fill_in "Name{30}", with: @quote.name{30}
    fill_in "Project", with: @quote.project_id
    fill_in "Quote to", with: @quote.quote_to_id
    fill_in "Rep", with: @quote.rep_id
    click_on "Create Quote"

    assert_text "Quote was successfully created"
    click_on "Back"
  end

  test "updating a Quote" do
    visit quotes_url
    click_on "Edit", match: :first

    fill_in "Council", with: @quote.council
    fill_in "Duration", with: @quote.duration
    fill_in "Expected start", with: @quote.expected_start
    fill_in "Fire ants", with: @quote.fire_ants
    fill_in "Fire ants verified by", with: @quote.fire_ants_verified_by
    fill_in "Inclusions", with: @quote.inclusions
    fill_in "Name{30}", with: @quote.name{30}
    fill_in "Project", with: @quote.project_id
    fill_in "Quote to", with: @quote.quote_to_id
    fill_in "Rep", with: @quote.rep_id
    click_on "Update Quote"

    assert_text "Quote was successfully updated"
    click_on "Back"
  end

  test "destroying a Quote" do
    visit quotes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Quote was successfully destroyed"
  end
end
