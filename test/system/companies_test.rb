require "application_system_test_case"

class CompaniesTest < ApplicationSystemTestCase
  setup do
    @company = companies(:one)
  end

  test "visiting the index" do
    visit companies_url
    assert_selector "h1", text: "Companies"
  end

  test "creating a Company" do
    visit companies_url
    click_on "New Company"

    fill_in "Po required", with: @company.PO_required
    fill_in "Active", with: @company.active
    fill_in "Bookkeeping number", with: @company.bookkeeping_number
    fill_in "Credit terms", with: @company.credit_terms
    fill_in "Licensee", with: @company.licensee
    fill_in "Line of business", with: @company.line_of_business
    fill_in "Name", with: @company.name
    fill_in "Url", with: @company.url
    click_on "Create Company"

    assert_text "Company was successfully created"
    click_on "Back"
  end

  test "updating a Company" do
    visit companies_url
    click_on "Edit", match: :first

    fill_in "Po required", with: @company.PO_required
    fill_in "Active", with: @company.active
    fill_in "Bookkeeping number", with: @company.bookkeeping_number
    fill_in "Credit terms", with: @company.credit_terms
    fill_in "Licensee", with: @company.licensee
    fill_in "Line of business", with: @company.line_of_business
    fill_in "Name", with: @company.name
    fill_in "Url", with: @company.url
    click_on "Update Company"

    assert_text "Company was successfully updated"
    click_on "Back"
  end

  test "destroying a Company" do
    visit companies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Company was successfully destroyed"
  end
end
