require 'test_helper'

class StudentSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get student_new_path
    assert_no_difference 'Student.count' do
      post student_path, params: { user: { name:  "",
                                         email: "student@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'student/new'
  end

  test "valid signup information" do
    get student_new_path
    assert_difference 'Student.count', 1 do
      post student_path, params: { user: { name:  "Example User",
                                         email: "student@gmail.com",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'student/show'
  end
end
