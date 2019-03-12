require 'test_helper'

class AddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @address = addresses(:one)
  end

  test "should get index" do
    get addresses_url
    assert_response :success
  end

  test "should get new" do
    get new_address_url
    assert_response :success
  end

  test "should create address" do
    assert_difference('Address.count') do
      post addresses_url, params: { address: { cert_id: @address.cert_id, cert_type: @address.cert_type, city,: @address.city,, company_id: @address.company_id, company_type: @address.company_type, identifier_id: @address.identifier_id, identifier_type: @address.identifier_type, latitude: @address.latitude, longitude: @address.longitude, map_reference: @address.map_reference, person_id: @address.person_id, person_type: @address.person_type, po_box: @address.po_box, requirement_id: @address.requirement_id, requirement_type: @address.requirement_type, state,: @address.state,, street_address,: @address.street_address, } }
    end

    assert_redirected_to address_url(Address.last)
  end

  test "should show address" do
    get address_url(@address)
    assert_response :success
  end

  test "should get edit" do
    get edit_address_url(@address)
    assert_response :success
  end

  test "should update address" do
    patch address_url(@address), params: { address: { cert_id: @address.cert_id, cert_type: @address.cert_type, city,: @address.city,, company_id: @address.company_id, company_type: @address.company_type, identifier_id: @address.identifier_id, identifier_type: @address.identifier_type, latitude: @address.latitude, longitude: @address.longitude, map_reference: @address.map_reference, person_id: @address.person_id, person_type: @address.person_type, po_box: @address.po_box, requirement_id: @address.requirement_id, requirement_type: @address.requirement_type, state,: @address.state,, street_address,: @address.street_address, } }
    assert_redirected_to address_url(@address)
  end

  test "should destroy address" do
    assert_difference('Address.count', -1) do
      delete address_url(@address)
    end

    assert_redirected_to addresses_url
  end
end
