require "application_system_test_case"

class ShipmentsTest < ApplicationSystemTestCase
  setup do
    @shipment = shipments(:one)
  end

  test "visiting the index" do
    visit shipments_url
    assert_selector "h1", text: "Shipments"
  end

  test "creating a Shipment" do
    visit shipments_url
    click_on "New Shipment"

    fill_in "Body", with: @shipment.body
    fill_in "Deliver", with: @shipment.deliver
    fill_in "Pickup", with: @shipment.pickup
    fill_in "Quote basis", with: @shipment.quote_basis
    fill_in "Quote complete", with: @shipment.quote_complete
    fill_in "Ship from", with: @shipment.ship_from
    fill_in "Ship to", with: @shipment.ship_to
    fill_in "Tracking", with: @shipment.tracking_id
    click_on "Create Shipment"

    assert_text "Shipment was successfully created"
    click_on "Back"
  end

  test "updating a Shipment" do
    visit shipments_url
    click_on "Edit", match: :first

    fill_in "Body", with: @shipment.body
    fill_in "Deliver", with: @shipment.deliver
    fill_in "Pickup", with: @shipment.pickup
    fill_in "Quote basis", with: @shipment.quote_basis
    fill_in "Quote complete", with: @shipment.quote_complete
    fill_in "Ship from", with: @shipment.ship_from
    fill_in "Ship to", with: @shipment.ship_to
    fill_in "Tracking", with: @shipment.tracking_id
    click_on "Update Shipment"

    assert_text "Shipment was successfully updated"
    click_on "Back"
  end

  test "destroying a Shipment" do
    visit shipments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Shipment was successfully destroyed"
  end
end
