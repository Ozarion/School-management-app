require 'test_helper'

class ParentTest < ActiveSupport::TestCase
  def setup
    @parent = Parent.new(name: "Example_parent", email: "parent@gmail.com", address: "example example town", phone_number: "0234567898", password: "example", password_confirmation: "example")
end

test "should be valid" do
  assert @parent.valid?
end

test "name should be present" do
  @parent.name = "    "
  assert_not @parent.valid?
end

test "email should be present" do
  @parent.email = "   "
  assert_not @parent.valid?
end

test "address should be present" do
  @parent.address = "   "
  assert_not @parent.valid?
end

test "phone number should be present" do
  @parent.phone_number = "    "
  assert_not @parent.valid?
end

test "name should not be too long" do
  @parent.name = "a" * 51
  assert_not @parent.valid?
end

test "email should not be too long" do
  @parent.email = "a" * 200 + "@gmail.com"
  assert_not @parent.valid?
end

test "address should not be too long" do
  @parent.address = "a" * 400
  assert_not @parent.valid?
end

test "phone number should not be too long" do
  @parent.phone_number = "1" * 12
  assert_not @parent.valid?
end

test "email validation should accept valid addresses" do
  valid_addresses = %w[parent@gmail.com parent@yahoo.com]
  valid_addresses.each do |valid_address|
    @parent.email = valid_address
    assert @parent.valid?, "#{valid_address.inspect} should be valid"
  end
end

test "email validation should reject invalid addresses" do
  invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                         foo@bar_baz.com foo@bar+baz.com]
  invalid_addresses.each do |invalid_address|
    @parent.email = invalid_address
    assert_not @parent.valid?, "#{invalid_address.inspect} should be invalid"
  end
end

test "email addresses should be unique" do
  duplicate_parent = @parent.dup
  duplicate_parent.email = @parent.email.upcase
  @parent.save
  assert_not duplicate_parent.valid?
end

test "phone number addresses should be unique" do
  duplicate_parent = @parent.dup
  @parent.save
  assert_not duplicate_parent.valid?
end

test "password should be present (nonblank)" do
  @parent.password = @parent.password_confirmation = " " * 6
  assert_not @parent.valid?
end

test "password should have a minimum length" do
  @parent.password = @parent.password_confirmation = "a" * 5
  assert_not @parent.valid?
end
end
