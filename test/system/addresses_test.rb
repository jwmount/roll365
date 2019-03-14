require "application_system_test_case"

class AddressesTest < ApplicationSystemTestCase
  setup do
    @address = addresses(:one)
  end

  test "visiting the index" do
    visit addresses_url
    assert_selector "h1", text: "Addresses"
  end

  test "creating a Address" do
    visit addresses_url
    click_on "New Address"

    fill_in "Addressable", with: @address.addressable_id
    fill_in "Addressable type", with: @address.addressable_type
    fill_in "City", with: @address.city
    fill_in "Latitude", with: @address.latitude
    fill_in "Longitude", with: @address.longitude
    fill_in "Map reference", with: @address.map_reference
    fill_in "Po box", with: @address.po_box
    fill_in "State", with: @address.state
    fill_in "Street address", with: @address.street_address
    click_on "Create Address"

    assert_text "Address was successfully created"
    click_on "Back"
  end

  test "updating a Address" do
    visit addresses_url
    click_on "Edit", match: :first

    fill_in "Addressable", with: @address.addressable_id
    fill_in "Addressable type", with: @address.addressable_type
    fill_in "City", with: @address.city
    fill_in "Latitude", with: @address.latitude
    fill_in "Longitude", with: @address.longitude
    fill_in "Map reference", with: @address.map_reference
    fill_in "Po box", with: @address.po_box
    fill_in "State", with: @address.state
    fill_in "Street address", with: @address.street_address
    click_on "Update Address"

    assert_text "Address was successfully updated"
    click_on "Back"
  end

  test "destroying a Address" do
    visit addresses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Address was successfully destroyed"
  end
end
