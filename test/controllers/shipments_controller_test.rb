require 'test_helper'

class ShipmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shipment = shipments(:one)
  end

  test "should get index" do
    get shipments_url
    assert_response :success
  end

  test "should get new" do
    get new_shipment_url
    assert_response :success
  end

  test "should create shipment" do
    assert_difference('Shipment.count') do
      post shipments_url, params: { shipment: { body: @shipment.body, deliver: @shipment.deliver, pickup: @shipment.pickup, quote_basis: @shipment.quote_basis, quote_complete: @shipment.quote_complete, ship_from: @shipment.ship_from, ship_to: @shipment.ship_to, tracking_id: @shipment.tracking_id } }
    end

    assert_redirected_to shipment_url(Shipment.last)
  end

  test "should show shipment" do
    get shipment_url(@shipment)
    assert_response :success
  end

  test "should get edit" do
    get edit_shipment_url(@shipment)
    assert_response :success
  end

  test "should update shipment" do
    patch shipment_url(@shipment), params: { shipment: { body: @shipment.body, deliver: @shipment.deliver, pickup: @shipment.pickup, quote_basis: @shipment.quote_basis, quote_complete: @shipment.quote_complete, ship_from: @shipment.ship_from, ship_to: @shipment.ship_to, tracking_id: @shipment.tracking_id } }
    assert_redirected_to shipment_url(@shipment)
  end

  test "should destroy shipment" do
    assert_difference('Shipment.count', -1) do
      delete shipment_url(@shipment)
    end

    assert_redirected_to shipments_url
  end
end
