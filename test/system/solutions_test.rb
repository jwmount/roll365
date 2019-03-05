require "application_system_test_case"

class SolutionsTest < ApplicationSystemTestCase
  setup do
    @solution = solutions(:one)
  end

  test "visiting the index" do
    visit solutions_url
    assert_selector "h1", text: "Solutions"
  end

  test "creating a Solution" do
    visit solutions_url
    click_on "New Solution"

    fill_in "Approved", with: @solution.approved
    fill_in "Client approved", with: @solution.client_approved
    fill_in "Drive time from load to tip", with: @solution.drive_time_from_load_to_tip
    fill_in "Drive time into site", with: @solution.drive_time_into_site
    fill_in "Drive time into tip", with: @solution.drive_time_into_tip
    fill_in "Drive time out of site", with: @solution.drive_time_out_of_site
    fill_in "Drive time out of tip site", with: @solution.drive_time_out_of_tip_site
    fill_in "Drive time tip to load", with: @solution.drive_time_tip_to_load
    fill_in "Equipment dollars per day", with: @solution.equipment_dollars_per_day
    fill_in "Equipment name", with: @solution.equipment_name
    fill_in "Equipment units required per day", with: @solution.equipment_units_required_per_day
    fill_in "Hourly hire rate", with: @solution.hourly_hire_rate
    fill_in "Invoice load client", with: @solution.invoice_load_client
    fill_in "Invoice tip client", with: @solution.invoice_tip_client
    fill_in "Kms one way", with: @solution.kms_one_way
    fill_in "Load time", with: @solution.load_time
    fill_in "Loads per day", with: @solution.loads_per_day
    fill_in "Material", with: @solution.material_id
    fill_in "Name", with: @solution.name
    fill_in "Pay equipment per unit", with: @solution.pay_equipment_per_unit
    fill_in "Pay load client", with: @solution.pay_load_client
    fill_in "Pay tip", with: @solution.pay_tip
    fill_in "Pay tip client", with: @solution.pay_tip_client
    fill_in "Pay tolls", with: @solution.pay_tolls
    fill_in "Purchase order required", with: @solution.purchase_order_required
    fill_in "Quote", with: @solution.quote_id
    fill_in "Semis permitted", with: @solution.semis_permitted
    fill_in "Solution type", with: @solution.solution_type
    fill_in "Total material", with: @solution.total_material
    fill_in "Unit of material", with: @solution.unit_of_material
    fill_in "Unload time", with: @solution.unload_time
    click_on "Create Solution"

    assert_text "Solution was successfully created"
    click_on "Back"
  end

  test "updating a Solution" do
    visit solutions_url
    click_on "Edit", match: :first

    fill_in "Approved", with: @solution.approved
    fill_in "Client approved", with: @solution.client_approved
    fill_in "Drive time from load to tip", with: @solution.drive_time_from_load_to_tip
    fill_in "Drive time into site", with: @solution.drive_time_into_site
    fill_in "Drive time into tip", with: @solution.drive_time_into_tip
    fill_in "Drive time out of site", with: @solution.drive_time_out_of_site
    fill_in "Drive time out of tip site", with: @solution.drive_time_out_of_tip_site
    fill_in "Drive time tip to load", with: @solution.drive_time_tip_to_load
    fill_in "Equipment dollars per day", with: @solution.equipment_dollars_per_day
    fill_in "Equipment name", with: @solution.equipment_name
    fill_in "Equipment units required per day", with: @solution.equipment_units_required_per_day
    fill_in "Hourly hire rate", with: @solution.hourly_hire_rate
    fill_in "Invoice load client", with: @solution.invoice_load_client
    fill_in "Invoice tip client", with: @solution.invoice_tip_client
    fill_in "Kms one way", with: @solution.kms_one_way
    fill_in "Load time", with: @solution.load_time
    fill_in "Loads per day", with: @solution.loads_per_day
    fill_in "Material", with: @solution.material_id
    fill_in "Name", with: @solution.name
    fill_in "Pay equipment per unit", with: @solution.pay_equipment_per_unit
    fill_in "Pay load client", with: @solution.pay_load_client
    fill_in "Pay tip", with: @solution.pay_tip
    fill_in "Pay tip client", with: @solution.pay_tip_client
    fill_in "Pay tolls", with: @solution.pay_tolls
    fill_in "Purchase order required", with: @solution.purchase_order_required
    fill_in "Quote", with: @solution.quote_id
    fill_in "Semis permitted", with: @solution.semis_permitted
    fill_in "Solution type", with: @solution.solution_type
    fill_in "Total material", with: @solution.total_material
    fill_in "Unit of material", with: @solution.unit_of_material
    fill_in "Unload time", with: @solution.unload_time
    click_on "Update Solution"

    assert_text "Solution was successfully updated"
    click_on "Back"
  end

  test "destroying a Solution" do
    visit solutions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Solution was successfully destroyed"
  end
end
