require "application_system_test_case"

class IdentifiersTest < ApplicationSystemTestCase
  setup do
    @identifier = identifiers(:one)
  end

  test "visiting the index" do
    visit identifiers_url
    assert_selector "h1", text: "Identifiers"
  end

  test "creating a Identifier" do
    visit identifiers_url
    click_on "New Identifier"

    fill_in "Company", with: @identifier.company_id
    fill_in "Company type", with: @identifier.company_type
    fill_in "Name{30}", with: @identifier.name{30}
    fill_in "Person", with: @identifier.person_id
    fill_in "Person type", with: @identifier.person_type
    fill_in "Rank", with: @identifier.rank
    fill_in "Value{30}", with: @identifier.value{30}
    click_on "Create Identifier"

    assert_text "Identifier was successfully created"
    click_on "Back"
  end

  test "updating a Identifier" do
    visit identifiers_url
    click_on "Edit", match: :first

    fill_in "Company", with: @identifier.company_id
    fill_in "Company type", with: @identifier.company_type
    fill_in "Name{30}", with: @identifier.name{30}
    fill_in "Person", with: @identifier.person_id
    fill_in "Person type", with: @identifier.person_type
    fill_in "Rank", with: @identifier.rank
    fill_in "Value{30}", with: @identifier.value{30}
    click_on "Update Identifier"

    assert_text "Identifier was successfully updated"
    click_on "Back"
  end

  test "destroying a Identifier" do
    visit identifiers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Identifier was successfully destroyed"
  end
end
