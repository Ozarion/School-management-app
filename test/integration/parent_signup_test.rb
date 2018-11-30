require 'test_helper'

class ParentSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get parent_new_path
    assert_no_difference 'Parent.count' do
      post parent_path, params: { user: { name:  "",
                                         email: "parent@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'parent/new'
  end

  test "valid signup information" do
    get parent_new_path
    assert_difference 'Parent.count', 1 do
      post parent_path, params: { user: { name:  "Example User",
                                         email: "parent@gmail.com",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'parent/show'
  end
end