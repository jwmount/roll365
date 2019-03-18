require 'test_helper'

class PermitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @permit = permits(:one)
  end

  test "should get index" do
    get permits_url
    assert_response :success
  end

  test "should get new" do
    get new_permit_url
    assert_response :success
  end

  test "should create permit" do
    assert_difference('Permit.count') do
      post permits_url, params: { permit: { basis: @permit.basis, description: @permit.description, for_company: @permit.for_company, for_equipment: @permit.for_equipment, for_location: @permit.for_location, for_person: @permit.for_person, issuer: @permit.issuer, jurisdiction: @permit.jurisdiction, name: @permit.name, permanent: @permit.permanent, permitable_id: @permit.permitable_id, permitable_type: @permit.permitable_type, required: @permit.required, valid_from: @permit.valid_from, valid_to: @permit.valid_to } }
    end

    assert_redirected_to permit_url(Permit.last)
  end

  test "should show permit" do
    get permit_url(@permit)
    assert_response :success
  end

  test "should get edit" do
    get edit_permit_url(@permit)
    assert_response :success
  end

  test "should update permit" do
    patch permit_url(@permit), params: { permit: { basis: @permit.basis, description: @permit.description, for_company: @permit.for_company, for_equipment: @permit.for_equipment, for_location: @permit.for_location, for_person: @permit.for_person, issuer: @permit.issuer, jurisdiction: @permit.jurisdiction, name: @permit.name, permanent: @permit.permanent, permitable_id: @permit.permitable_id, permitable_type: @permit.permitable_type, required: @permit.required, valid_from: @permit.valid_from, valid_to: @permit.valid_to } }
    assert_redirected_to permit_url(@permit)
  end

  test "should destroy permit" do
    assert_difference('Permit.count', -1) do
      delete permit_url(@permit)
    end

    assert_redirected_to permits_url
  end
end
