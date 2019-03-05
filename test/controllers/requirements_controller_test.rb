require 'test_helper'

class RequirementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @requirement = requirements(:one)
  end

  test "should get index" do
    get requirements_url
    assert_response :success
  end

  test "should get new" do
    get new_requirement_url
    assert_response :success
  end

  test "should create requirement" do
    assert_difference('Requirement.count') do
      post requirements_url, params: { requirement: { certificate_id: @requirement.certificate_id, description: @requirement.description, for_company: @requirement.for_company, for_location: @requirement.for_location, for_person: @requirement.for_person, preference: @requirement.preference, require_id: @requirement.require_id, require_type: @requirement.require_type } }
    end

    assert_redirected_to requirement_url(Requirement.last)
  end

  test "should show requirement" do
    get requirement_url(@requirement)
    assert_response :success
  end

  test "should get edit" do
    get edit_requirement_url(@requirement)
    assert_response :success
  end

  test "should update requirement" do
    patch requirement_url(@requirement), params: { requirement: { certificate_id: @requirement.certificate_id, description: @requirement.description, for_company: @requirement.for_company, for_location: @requirement.for_location, for_person: @requirement.for_person, preference: @requirement.preference, require_id: @requirement.require_id, require_type: @requirement.require_type } }
    assert_redirected_to requirement_url(@requirement)
  end

  test "should destroy requirement" do
    assert_difference('Requirement.count', -1) do
      delete requirement_url(@requirement)
    end

    assert_redirected_to requirements_url
  end
end
