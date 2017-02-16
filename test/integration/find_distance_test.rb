require 'test_helper'

class FindDistanceTest < ActionDispatch::IntegrationTest

  test "user cen get distance between two locations" do
    get root_path
    assert_response :success
  end


end
