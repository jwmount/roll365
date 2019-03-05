require 'test_helper'

class EngagementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @engagement = engagements(:one)
  end

  test "should get index" do
    get engagements_url
    assert_response :success
  end

  test "should get new" do
    get new_engagement_url
    assert_response :success
  end

  test "should create engagement" do
    assert_difference('Engagement.count') do
      post engagements_url, params: { engagement: { OK_tomorrow: @engagement.OK_tomorrow, breakdown: @engagement.breakdown, docket_id: @engagement.docket_id, docket_number: @engagement.docket_number, engagement_declined: @engagement.engagement_declined, no_show: @engagement.no_show, onsite_at: @engagement.onsite_at, onsite_now: @engagement.onsite_now, person_id: @engagement.person_id, schedule_id: @engagement.schedule_id } }
    end

    assert_redirected_to engagement_url(Engagement.last)
  end

  test "should show engagement" do
    get engagement_url(@engagement)
    assert_response :success
  end

  test "should get edit" do
    get edit_engagement_url(@engagement)
    assert_response :success
  end

  test "should update engagement" do
    patch engagement_url(@engagement), params: { engagement: { OK_tomorrow: @engagement.OK_tomorrow, breakdown: @engagement.breakdown, docket_id: @engagement.docket_id, docket_number: @engagement.docket_number, engagement_declined: @engagement.engagement_declined, no_show: @engagement.no_show, onsite_at: @engagement.onsite_at, onsite_now: @engagement.onsite_now, person_id: @engagement.person_id, schedule_id: @engagement.schedule_id } }
    assert_redirected_to engagement_url(@engagement)
  end

  test "should destroy engagement" do
    assert_difference('Engagement.count', -1) do
      delete engagement_url(@engagement)
    end

    assert_redirected_to engagements_url
  end
end
