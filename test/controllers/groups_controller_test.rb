require 'test_helper'

class GroupsControllerTest < ActionController::TestCase
  test "should get group" do
    get :group
    assert_response :success
  end

end
