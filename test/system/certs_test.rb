require "application_system_test_case"

class CertsTest < ApplicationSystemTestCase
  setup do
    @cert = certs(:one)
  end

  test "visiting the index" do
    visit certs_url
    assert_selector "h1", text: "Certs"
  end

  test "creating a Cert" do
    visit certs_url
    click_on "New Cert"

    fill_in "Active", with: @cert.active
    fill_in "Certifiable", with: @cert.certifiable_id
    fill_in "Expires on", with: @cert.expires_on
    fill_in "Permanent", with: @cert.permanent
    fill_in "Require", with: @cert.require_id
    fill_in "Require type", with: @cert.require_type
    fill_in "Serial number", with: @cert.serial_number
    click_on "Create Cert"

    assert_text "Cert was successfully created"
    click_on "Back"
  end

  test "updating a Cert" do
    visit certs_url
    click_on "Edit", match: :first

    fill_in "Active", with: @cert.active
    fill_in "Certifiable", with: @cert.certifiable_id
    fill_in "Expires on", with: @cert.expires_on
    fill_in "Permanent", with: @cert.permanent
    fill_in "Require", with: @cert.require_id
    fill_in "Require type", with: @cert.require_type
    fill_in "Serial number", with: @cert.serial_number
    click_on "Update Cert"

    assert_text "Cert was successfully updated"
    click_on "Back"
  end

  test "destroying a Cert" do
    visit certs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cert was successfully destroyed"
  end
end
