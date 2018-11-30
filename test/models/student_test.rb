require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  def setup
    @student = Student.new(name: "Example_student", email: "student@gmail.com", address: "example example town", phone_number: "0234567898", password: "example", password_confirmation: "example")
end

test "should be valid" do
  assert @student.valid?
end

test "name should be present" do
  @student.name = "    "
  assert_not @student.valid?
end

test "email should be present" do
  @student.email = "   "
  assert_not @student.valid?
end

test "address should be present" do
  @student.address = "   "
  assert_not @student.valid?
end

test "phone number should be present" do
  @student.phone_number = "    "
  assert_not @student.valid?
end

test "name should not be too long" do
  @student.name = "a" * 51
  assert_not @student.valid?
end

test "email should not be too long" do
  @student.email = "a" * 200 + "@gmail.com"
  assert_not @student.valid?
end

test "address should not be too long" do
  @student.address = "a" * 400
  assert_not @student.valid?
end

test "phone number should not be too long" do
  @student.phone_number = "1" * 12
  assert_not @student.valid?
end

test "email validation should accept valid addresses" do
  valid_addresses = %w[student@gmail.com student@yahoo.com]
  valid_addresses.each do |valid_address|
    @student.email = valid_address
    assert @student.valid?, "#{valid_address.inspect} should be valid"
  end
end

test "email validation should reject invalid addresses" do
  invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                         foo@bar_baz.com foo@bar+baz.com]
  invalid_addresses.each do |invalid_address|
    @student.email = invalid_address
    assert_not @student.valid?, "#{invalid_address.inspect} should be invalid"
  end
end

test "email addresses should be unique" do
  duplicate_student = @student.dup
  duplicate_student.email = @student.email.upcase
  @student.save
  assert_not duplicate_student.valid?
end

test "phone number addresses should be unique" do
  duplicate_student = @student.dup
  @student.save
  assert_not duplicate_student.valid?
end

test "password should be present (nonblank)" do
  @student.password = @student.password_confirmation = " " * 6
  assert_not @student.valid?
end

test "password should have a minimum length" do
  @student.password = @student.password_confirmation = "a" * 5
  assert_not @student.valid?
end
end
