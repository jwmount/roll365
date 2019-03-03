require 'test_helper'

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company = companies(:one)
  end

  test "should get index" do
    get companies_url
    assert_response :success
  end

  test "should get new" do
    get new_company_url
    assert_response :success
  end

  test "should create company" do
    assert_difference('Company.count') do
      post companies_url, params: { company: { PO_required: @company.PO_required, active: @company.active, bookkeeping_number: @company.bookkeeping_number, credit_terms: @company.credit_terms, licensee: @company.licensee, line_of_business: @company.line_of_business, name: @company.name, url: @company.url } }
    end

    assert_redirected_to company_url(Company.last)
  end

  test "should show company" do
    get company_url(@company)
    assert_response :success
  end

  test "should get edit" do
    get edit_company_url(@company)
    assert_response :success
  end

  test "should update company" do
    patch company_url(@company), params: { company: { PO_required: @company.PO_required, active: @company.active, bookkeeping_number: @company.bookkeeping_number, credit_terms: @company.credit_terms, licensee: @company.licensee, line_of_business: @company.line_of_business, name: @company.name, url: @company.url } }
    assert_redirected_to company_url(@company)
  end

  test "should destroy company" do
    assert_difference('Company.count', -1) do
      delete company_url(@company)
    end

    assert_redirected_to companies_url
  end
end
