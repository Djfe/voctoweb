require 'test_helper'

class Public::RecordingsControllerTest < ActionController::TestCase
  test "should get index" do
    create :conference_with_recordings
    get :index, format: :json
    assert_response :success
    refute_empty JSON.parse(response.body)
    #puts JSON.pretty_generate JSON.parse(response.body)
  end

  test "should get show" do
    create :conference_with_recordings
    get :show, id: 1, format: :json
    assert_response :success
    refute_empty JSON.parse(response.body)
    #puts JSON.pretty_generate JSON.parse(response.body)
  end

  test "should increase view count" do
    create :conference_with_recordings
    e = Event.first
    r = e.recordings.first
    post :count, event_id: e.id, src: r.filename, format: :json
    assert_response :success
    refute_empty JSON.parse(response.body)
    assert_equal 'ok', JSON.parse(response.body)['status']
  end
end
