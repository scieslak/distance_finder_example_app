require 'test_helper'

class FindDistanceTest < ActionDispatch::IntegrationTest

  test "user cen get distance between two locations" do
    get root_path
    assert_response :success

    assert_select "form[method=post]" do
      assert_select "input[type=text][name=?]", "origin"
      assert_select "input[type=text][name=?]", "destination"
      assert_select "input[type=submit][value=?]", "Calculate"
    end

  end


end
