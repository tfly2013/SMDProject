require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post :create, event: { condition: @event.condition, description: @event.description, group_id: @event.group_id, location: @event.location, name: @event.name, society_id: @event.society_id, status: @event.status, string: @event.string, time: @event.time, type: @event.type, webpage: @event.webpage }
    end

    assert_redirected_to event_path(assigns(:event))
  end

  test "should show event" do
    get :show, id: @event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event
    assert_response :success
  end

  test "should update event" do
    patch :update, id: @event, event: { condition: @event.condition, description: @event.description, group_id: @event.group_id, location: @event.location, name: @event.name, society_id: @event.society_id, status: @event.status, string: @event.string, time: @event.time, type: @event.type, webpage: @event.webpage }
    assert_redirected_to event_path(assigns(:event))
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete :destroy, id: @event
    end

    assert_redirected_to events_path
  end
end
