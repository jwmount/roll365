require "application_system_test_case"

class DocketsTest < ApplicationSystemTestCase
  setup do
    @docket = dockets(:one)
  end

  test "visiting the index" do
    visit dockets_url
    assert_selector "h1", text: "Dockets"
  end

  test "creating a Docket" do
    visit dockets_url
    click_on "New Docket"

    fill_in "A inv pay", with: @docket.a_inv_pay
    fill_in "Approved", with: @docket.approved
    fill_in "Approved by", with: @docket.approved_by
    fill_in "Approved on", with: @docket.approved_on
    fill_in "B inv pay", with: @docket.b_inv_pay
    fill_in "Client signed", with: @docket.client_signed
    fill_in "Date worked", with: @docket.date_worked
    fill_in "Dated", with: @docket.dated
    fill_in "Engagement", with: @docket.engagement_id
    fill_in "Number", with: @docket.number
    fill_in "Operator signed", with: @docket.operator_signed
    fill_in "Person", with: @docket.person_id
    fill_in "Received on", with: @docket.received_on
    fill_in "Supplier inv pay", with: @docket.supplier_inv_pay
    click_on "Create Docket"

    assert_text "Docket was successfully created"
    click_on "Back"
  end

  test "updating a Docket" do
    visit dockets_url
    click_on "Edit", match: :first

    fill_in "A inv pay", with: @docket.a_inv_pay
    fill_in "Approved", with: @docket.approved
    fill_in "Approved by", with: @docket.approved_by
    fill_in "Approved on", with: @docket.approved_on
    fill_in "B inv pay", with: @docket.b_inv_pay
    fill_in "Client signed", with: @docket.client_signed
    fill_in "Date worked", with: @docket.date_worked
    fill_in "Dated", with: @docket.dated
    fill_in "Engagement", with: @docket.engagement_id
    fill_in "Number", with: @docket.number
    fill_in "Operator signed", with: @docket.operator_signed
    fill_in "Person", with: @docket.person_id
    fill_in "Received on", with: @docket.received_on
    fill_in "Supplier inv pay", with: @docket.supplier_inv_pay
    click_on "Update Docket"

    assert_text "Docket was successfully updated"
    click_on "Back"
  end

  test "destroying a Docket" do
    visit dockets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Docket was successfully destroyed"
  end
end
