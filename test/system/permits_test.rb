require "application_system_test_case"

class PermitsTest < ApplicationSystemTestCase
  setup do
    @permit = permits(:one)
  end

  test "visiting the index" do
    visit permits_url
    assert_selector "h1", text: "Permits"
  end

  test "creating a Permit" do
    visit permits_url
    click_on "New Permit"

    fill_in "Basis", with: @permit.basis
    fill_in "Description", with: @permit.description
    fill_in "For company", with: @permit.for_company
    fill_in "For equipment", with: @permit.for_equipment
    fill_in "For location", with: @permit.for_location
    fill_in "For person", with: @permit.for_person
    fill_in "Issuer", with: @permit.issuer
    fill_in "Jurisdiction", with: @permit.jurisdiction
    fill_in "Name", with: @permit.name
    fill_in "Permanent", with: @permit.permanent
    fill_in "Permitable", with: @permit.permitable_id
    fill_in "Permitable type", with: @permit.permitable_type
    fill_in "Required", with: @permit.required
    fill_in "Valid from", with: @permit.valid_from
    fill_in "Valid to", with: @permit.valid_to
    click_on "Create Permit"

    assert_text "Permit was successfully created"
    click_on "Back"
  end

  test "updating a Permit" do
    visit permits_url
    click_on "Edit", match: :first

    fill_in "Basis", with: @permit.basis
    fill_in "Description", with: @permit.description
    fill_in "For company", with: @permit.for_company
    fill_in "For equipment", with: @permit.for_equipment
    fill_in "For location", with: @permit.for_location
    fill_in "For person", with: @permit.for_person
    fill_in "Issuer", with: @permit.issuer
    fill_in "Jurisdiction", with: @permit.jurisdiction
    fill_in "Name", with: @permit.name
    fill_in "Permanent", with: @permit.permanent
    fill_in "Permitable", with: @permit.permitable_id
    fill_in "Permitable type", with: @permit.permitable_type
    fill_in "Required", with: @permit.required
    fill_in "Valid from", with: @permit.valid_from
    fill_in "Valid to", with: @permit.valid_to
    click_on "Update Permit"

    assert_text "Permit was successfully updated"
    click_on "Back"
  end

  test "destroying a Permit" do
    visit permits_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Permit was successfully destroyed"
  end
end
