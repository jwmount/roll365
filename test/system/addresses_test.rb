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

    fill_in "City{30}", with: @address.city{30}
    fill_in "Company", with: @address.company_id
    fill_in "Company type", with: @address.company_type
    fill_in "Latitude", with: @address.latitude
    fill_in "Longitude", with: @address.longitude
    fill_in "Map reference", with: @address.map_reference
    fill_in "Post code{10}", with: @address.post_code{10}
    fill_in "State{2}", with: @address.state{2}
    fill_in "Street{30}", with: @address.street{30}
    click_on "Create Address"

    assert_text "Address was successfully created"
    click_on "Back"
  end

  test "updating a Address" do
    visit addresses_url
    click_on "Edit", match: :first

    fill_in "City{30}", with: @address.city{30}
    fill_in "Company", with: @address.company_id
    fill_in "Company type", with: @address.company_type
    fill_in "Latitude", with: @address.latitude
    fill_in "Longitude", with: @address.longitude
    fill_in "Map reference", with: @address.map_reference
    fill_in "Post code{10}", with: @address.post_code{10}
    fill_in "State{2}", with: @address.state{2}
    fill_in "Street{30}", with: @address.street{30}
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
