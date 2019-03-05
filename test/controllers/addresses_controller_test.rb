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
      post addresses_url, params: { address: { city{30}: @address.city{30}, company_id: @address.company_id, company_type: @address.company_type, latitude: @address.latitude, longitude: @address.longitude, map_reference: @address.map_reference, post_code{10}: @address.post_code{10}, state{2}: @address.state{2}, street{30}: @address.street{30} } }
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
    patch address_url(@address), params: { address: { city{30}: @address.city{30}, company_id: @address.company_id, company_type: @address.company_type, latitude: @address.latitude, longitude: @address.longitude, map_reference: @address.map_reference, post_code{10}: @address.post_code{10}, state{2}: @address.state{2}, street{30}: @address.street{30} } }
    assert_redirected_to address_url(@address)
  end

  test "should destroy address" do
    assert_difference('Address.count', -1) do
      delete address_url(@address)
    end

    assert_redirected_to addresses_url
  end
end
