require 'test_helper'

class DocketsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @docket = dockets(:one)
  end

  test "should get index" do
    get dockets_url
    assert_response :success
  end

  test "should get new" do
    get new_docket_url
    assert_response :success
  end

  test "should create docket" do
    assert_difference('Docket.count') do
      post dockets_url, params: { docket: { a_inv_pay: @docket.a_inv_pay, approved: @docket.approved, approved_by: @docket.approved_by, approved_on: @docket.approved_on, b_inv_pay: @docket.b_inv_pay, client_signed: @docket.client_signed, date_worked: @docket.date_worked, dated: @docket.dated, engagement_id: @docket.engagement_id, number: @docket.number, operator_signed: @docket.operator_signed, person_id: @docket.person_id, received_on: @docket.received_on, supplier_inv_pay: @docket.supplier_inv_pay } }
    end

    assert_redirected_to docket_url(Docket.last)
  end

  test "should show docket" do
    get docket_url(@docket)
    assert_response :success
  end

  test "should get edit" do
    get edit_docket_url(@docket)
    assert_response :success
  end

  test "should update docket" do
    patch docket_url(@docket), params: { docket: { a_inv_pay: @docket.a_inv_pay, approved: @docket.approved, approved_by: @docket.approved_by, approved_on: @docket.approved_on, b_inv_pay: @docket.b_inv_pay, client_signed: @docket.client_signed, date_worked: @docket.date_worked, dated: @docket.dated, engagement_id: @docket.engagement_id, number: @docket.number, operator_signed: @docket.operator_signed, person_id: @docket.person_id, received_on: @docket.received_on, supplier_inv_pay: @docket.supplier_inv_pay } }
    assert_redirected_to docket_url(@docket)
  end

  test "should destroy docket" do
    assert_difference('Docket.count', -1) do
      delete docket_url(@docket)
    end

    assert_redirected_to dockets_url
  end
end
