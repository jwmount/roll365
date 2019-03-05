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
      post identifiers_url, params: { identifier: { company_id: @identifier.company_id, company_type: @identifier.company_type, name{30}: @identifier.name{30}, person_id: @identifier.person_id, person_type: @identifier.person_type, rank: @identifier.rank, value{30}: @identifier.value{30} } }
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
    patch identifier_url(@identifier), params: { identifier: { company_id: @identifier.company_id, company_type: @identifier.company_type, name{30}: @identifier.name{30}, person_id: @identifier.person_id, person_type: @identifier.person_type, rank: @identifier.rank, value{30}: @identifier.value{30} } }
    assert_redirected_to identifier_url(@identifier)
  end

  test "should destroy identifier" do
    assert_difference('Identifier.count', -1) do
      delete identifier_url(@identifier)
    end

    assert_redirected_to identifiers_url
  end
end
