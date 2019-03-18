require 'test_helper'

class TrialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trial = trials(:one)
  end

  test "should get index" do
    get trials_url
    assert_response :success
  end

  test "should get new" do
    get new_trial_url
    assert_response :success
  end

  test "should create trial" do
    assert_difference('Trial.count') do
      post trials_url, params: { trial: { company_id: @trial.company_id, company_type: @trial.company_type, description: @trial.description, name: @trial.name, person_id: @trial.person_id, person_type: @trial.person_type, trialable_id: @trial.trialable_id, trialable_type: @trial.trialable_type } }
    end

    assert_redirected_to trial_url(Trial.last)
  end

  test "should show trial" do
    get trial_url(@trial)
    assert_response :success
  end

  test "should get edit" do
    get edit_trial_url(@trial)
    assert_response :success
  end

  test "should update trial" do
    patch trial_url(@trial), params: { trial: { company_id: @trial.company_id, company_type: @trial.company_type, description: @trial.description, name: @trial.name, person_id: @trial.person_id, person_type: @trial.person_type, trialable_id: @trial.trialable_id, trialable_type: @trial.trialable_type } }
    assert_redirected_to trial_url(@trial)
  end

  test "should destroy trial" do
    assert_difference('Trial.count', -1) do
      delete trial_url(@trial)
    end

    assert_redirected_to trials_url
  end
end
