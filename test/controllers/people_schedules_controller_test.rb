require 'test_helper'

class PeopleSchedulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @people_schedule = people_schedules(:one)
  end

  test "should get index" do
    get people_schedules_url
    assert_response :success
  end

  test "should get new" do
    get new_people_schedule_url
    assert_response :success
  end

  test "should create people_schedule" do
    assert_difference('PeopleSchedule.count') do
      post people_schedules_url, params: { people_schedule: { person_id: @people_schedule.person_id, schedule_id: @people_schedule.schedule_id } }
    end

    assert_redirected_to people_schedule_url(PeopleSchedule.last)
  end

  test "should show people_schedule" do
    get people_schedule_url(@people_schedule)
    assert_response :success
  end

  test "should get edit" do
    get edit_people_schedule_url(@people_schedule)
    assert_response :success
  end

  test "should update people_schedule" do
    patch people_schedule_url(@people_schedule), params: { people_schedule: { person_id: @people_schedule.person_id, schedule_id: @people_schedule.schedule_id } }
    assert_redirected_to people_schedule_url(@people_schedule)
  end

  test "should destroy people_schedule" do
    assert_difference('PeopleSchedule.count', -1) do
      delete people_schedule_url(@people_schedule)
    end

    assert_redirected_to people_schedules_url
  end
end
