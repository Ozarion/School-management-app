require 'test_helper'

class TeacherControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get teacher_new_url
    assert_response :success
  end

end
