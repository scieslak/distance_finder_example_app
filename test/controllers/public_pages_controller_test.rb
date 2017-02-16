require 'test_helper'

class PublicPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_response :success

    assert_select "form[method=post]" do
      assert_select "input[type=text][name=?]", "origin"
      assert_select "input[type=text][name=?]", "destination"
      assert_select "input[type=submit][value=?]", "Calculate"
    end


  end

end
