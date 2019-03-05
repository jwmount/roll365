require "application_system_test_case"

class SolutionTipsTest < ApplicationSystemTestCase
  setup do
    @solution_tip = solution_tips(:one)
  end

  test "visiting the index" do
    visit solution_tips_url
    assert_selector "h1", text: "Solution Tips"
  end

  test "creating a Solution tip" do
    visit solution_tips_url
    click_on "New Solution Tip"

    fill_in "Solution", with: @solution_tip.solution_id
    fill_in "Tip", with: @solution_tip.tip_id
    click_on "Create Solution tip"

    assert_text "Solution tip was successfully created"
    click_on "Back"
  end

  test "updating a Solution tip" do
    visit solution_tips_url
    click_on "Edit", match: :first

    fill_in "Solution", with: @solution_tip.solution_id
    fill_in "Tip", with: @solution_tip.tip_id
    click_on "Update Solution tip"

    assert_text "Solution tip was successfully updated"
    click_on "Back"
  end

  test "destroying a Solution tip" do
    visit solution_tips_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Solution tip was successfully destroyed"
  end
end
