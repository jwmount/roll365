require 'test_helper'

class SolutionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @solution = solutions(:one)
  end

  test "should get index" do
    get solutions_url
    assert_response :success
  end

  test "should get new" do
    get new_solution_url
    assert_response :success
  end

  test "should create solution" do
    assert_difference('Solution.count') do
      post solutions_url, params: { solution: { approved: @solution.approved, client_approved: @solution.client_approved, drive_time_from_load_to_tip: @solution.drive_time_from_load_to_tip, drive_time_into_site: @solution.drive_time_into_site, drive_time_into_tip: @solution.drive_time_into_tip, drive_time_out_of_site: @solution.drive_time_out_of_site, drive_time_out_of_tip_site: @solution.drive_time_out_of_tip_site, drive_time_tip_to_load: @solution.drive_time_tip_to_load, equipment_dollars_per_day: @solution.equipment_dollars_per_day, equipment_name: @solution.equipment_name, equipment_units_required_per_day: @solution.equipment_units_required_per_day, hourly_hire_rate: @solution.hourly_hire_rate, invoice_load_client: @solution.invoice_load_client, invoice_tip_client: @solution.invoice_tip_client, kms_one_way: @solution.kms_one_way, load_time: @solution.load_time, loads_per_day: @solution.loads_per_day, material_id: @solution.material_id, name: @solution.name, pay_equipment_per_unit: @solution.pay_equipment_per_unit, pay_load_client: @solution.pay_load_client, pay_tip: @solution.pay_tip, pay_tip_client: @solution.pay_tip_client, pay_tolls: @solution.pay_tolls, purchase_order_required: @solution.purchase_order_required, quote_id: @solution.quote_id, semis_permitted: @solution.semis_permitted, solution_type: @solution.solution_type, total_material: @solution.total_material, unit_of_material: @solution.unit_of_material, unload_time: @solution.unload_time } }
    end

    assert_redirected_to solution_url(Solution.last)
  end

  test "should show solution" do
    get solution_url(@solution)
    assert_response :success
  end

  test "should get edit" do
    get edit_solution_url(@solution)
    assert_response :success
  end

  test "should update solution" do
    patch solution_url(@solution), params: { solution: { approved: @solution.approved, client_approved: @solution.client_approved, drive_time_from_load_to_tip: @solution.drive_time_from_load_to_tip, drive_time_into_site: @solution.drive_time_into_site, drive_time_into_tip: @solution.drive_time_into_tip, drive_time_out_of_site: @solution.drive_time_out_of_site, drive_time_out_of_tip_site: @solution.drive_time_out_of_tip_site, drive_time_tip_to_load: @solution.drive_time_tip_to_load, equipment_dollars_per_day: @solution.equipment_dollars_per_day, equipment_name: @solution.equipment_name, equipment_units_required_per_day: @solution.equipment_units_required_per_day, hourly_hire_rate: @solution.hourly_hire_rate, invoice_load_client: @solution.invoice_load_client, invoice_tip_client: @solution.invoice_tip_client, kms_one_way: @solution.kms_one_way, load_time: @solution.load_time, loads_per_day: @solution.loads_per_day, material_id: @solution.material_id, name: @solution.name, pay_equipment_per_unit: @solution.pay_equipment_per_unit, pay_load_client: @solution.pay_load_client, pay_tip: @solution.pay_tip, pay_tip_client: @solution.pay_tip_client, pay_tolls: @solution.pay_tolls, purchase_order_required: @solution.purchase_order_required, quote_id: @solution.quote_id, semis_permitted: @solution.semis_permitted, solution_type: @solution.solution_type, total_material: @solution.total_material, unit_of_material: @solution.unit_of_material, unload_time: @solution.unload_time } }
    assert_redirected_to solution_url(@solution)
  end

  test "should destroy solution" do
    assert_difference('Solution.count', -1) do
      delete solution_url(@solution)
    end

    assert_redirected_to solutions_url
  end
end
