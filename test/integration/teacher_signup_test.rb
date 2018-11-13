require 'test_helper'

class TeacherSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get teacher_new_path
    assert_no_difference 'Teacher.count' do
      post teacher_path, params: { user: { name:  "",
                                         email: "teacher@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'teacher/new'
  end

  test "valid signup information" do
    get teacher_new_path
    assert_difference 'Teacher.count', 1 do
      post teacher_path, params: { user: { name:  "Example User",
                                         email: "teacher@gmail.com",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'teacher/show'
  end
end
