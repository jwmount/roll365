require "application_system_test_case"

class CertificatesTest < ApplicationSystemTestCase
  setup do
    @certificate = certificates(:one)
  end

  test "visiting the index" do
    visit certificates_url
    assert_selector "h1", text: "Certificates"
  end

  test "creating a Certificate" do
    visit certificates_url
    click_on "New Certificate"

    fill_in "Active", with: @certificate.active
    fill_in "Description", with: @certificate.description
    fill_in "For company", with: @certificate.for_company
    fill_in "For equipment", with: @certificate.for_equipment
    fill_in "For location", with: @certificate.for_location
    fill_in "For person", with: @certificate.for_person
    fill_in "Name", with: @certificate.name
    click_on "Create Certificate"

    assert_text "Certificate was successfully created"
    click_on "Back"
  end

  test "updating a Certificate" do
    visit certificates_url
    click_on "Edit", match: :first

    fill_in "Active", with: @certificate.active
    fill_in "Description", with: @certificate.description
    fill_in "For company", with: @certificate.for_company
    fill_in "For equipment", with: @certificate.for_equipment
    fill_in "For location", with: @certificate.for_location
    fill_in "For person", with: @certificate.for_person
    fill_in "Name", with: @certificate.name
    click_on "Update Certificate"

    assert_text "Certificate was successfully updated"
    click_on "Back"
  end

  test "destroying a Certificate" do
    visit certificates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Certificate was successfully destroyed"
  end
end
