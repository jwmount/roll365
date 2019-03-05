require 'test_helper'

class QuotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quote = quotes(:one)
  end

  test "should get index" do
    get quotes_url
    assert_response :success
  end

  test "should get new" do
    get new_quote_url
    assert_response :success
  end

  test "should create quote" do
    assert_difference('Quote.count') do
      post quotes_url, params: { quote: { council: @quote.council, duration: @quote.duration, expected_start: @quote.expected_start, fire_ants: @quote.fire_ants, fire_ants_verified_by: @quote.fire_ants_verified_by, inclusions: @quote.inclusions, name{30}: @quote.name{30}, project_id: @quote.project_id, quote_to_id: @quote.quote_to_id, rep_id: @quote.rep_id } }
    end

    assert_redirected_to quote_url(Quote.last)
  end

  test "should show quote" do
    get quote_url(@quote)
    assert_response :success
  end

  test "should get edit" do
    get edit_quote_url(@quote)
    assert_response :success
  end

  test "should update quote" do
    patch quote_url(@quote), params: { quote: { council: @quote.council, duration: @quote.duration, expected_start: @quote.expected_start, fire_ants: @quote.fire_ants, fire_ants_verified_by: @quote.fire_ants_verified_by, inclusions: @quote.inclusions, name{30}: @quote.name{30}, project_id: @quote.project_id, quote_to_id: @quote.quote_to_id, rep_id: @quote.rep_id } }
    assert_redirected_to quote_url(@quote)
  end

  test "should destroy quote" do
    assert_difference('Quote.count', -1) do
      delete quote_url(@quote)
    end

    assert_redirected_to quotes_url
  end
end
