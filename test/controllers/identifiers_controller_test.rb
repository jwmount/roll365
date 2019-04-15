require 'test_helper'

class IdentifiersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @identifier = identifiers(:one)
  end

  test "should get index" do
    get identifiers_url
    assert_response :success
  end

  test "should get new" do
    get new_identifier_url
    assert_response :success
  end

  test "should create identifier" do
    assert_difference('Identifier.count') do
        #post addresses_url, params: { address:    { addressable_id:  @address.addressable_id,     addressable_type:  @address.addressable_type, city: @address.city, latitude: @address.latitude, longitude: @address.longitude, map_reference: @address.map_reference, post_code: @address.po_box, state: @address.state, street_address: @address.street_address } }
      post identifiers_url, params: { identifier: { identifiable_id: @identifier.identifiable_id, identifiable_type: @identifier.identifiable_type, name: @identifier.name, person_id: @identifier.person_id, person_type: @identifier.person_type, rank: @identifier.rank } }
    end
    assert_redirected_to identifier_url(Identifier.last)
  end

  test "should show identifier" do
    get identifier_url(@identifier)
    assert_response :success
  end

  test "should get edit" do
    get edit_identifier_url(@identifier)
    assert_response :success
  end

  test "should update identifier" do
    patch identifier_url(@identifier), params: { identifier: { company_id: @identifier.company_id, company_type: @identifier.company_type, name: @identifier.name, person_id: @identifier.person_id, person_type: @identifier.person_type, rank: @identifier.rank } }
    assert_redirected_to identifier_url(@identifier)
  end

  test "should destroy identifier" do
    assert_difference('Identifier.count', -1) do
      delete identifier_url(@identifier)
    end

    assert_redirected_to identifiers_url
  end
end
