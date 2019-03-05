require 'test_helper'

class SolutionTipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @solution_tip = solution_tips(:one)
  end

  test "should get index" do
    get solution_tips_url
    assert_response :success
  end

  test "should get new" do
    get new_solution_tip_url
    assert_response :success
  end

  test "should create solution_tip" do
    assert_difference('SolutionTip.count') do
      post solution_tips_url, params: { solution_tip: { solution_id: @solution_tip.solution_id, tip_id: @solution_tip.tip_id } }
    end

    assert_redirected_to solution_tip_url(SolutionTip.last)
  end

  test "should show solution_tip" do
    get solution_tip_url(@solution_tip)
    assert_response :success
  end

  test "should get edit" do
    get edit_solution_tip_url(@solution_tip)
    assert_response :success
  end

  test "should update solution_tip" do
    patch solution_tip_url(@solution_tip), params: { solution_tip: { solution_id: @solution_tip.solution_id, tip_id: @solution_tip.tip_id } }
    assert_redirected_to solution_tip_url(@solution_tip)
  end

  test "should destroy solution_tip" do
    assert_difference('SolutionTip.count', -1) do
      delete solution_tip_url(@solution_tip)
    end

    assert_redirected_to solution_tips_url
  end
end
