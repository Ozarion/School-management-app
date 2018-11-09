require 'test_helper'

class TeacherTest < ActiveSupport::TestCase
  def setup
      @teacher = Teacher.new(name: "Example_teacher", email: "teacher@gmail.com", address: "example example town", phone_number: "0234567898", password: "example", password_confirmation: "example")
  end

  test "should be valid" do
    assert @teacher.valid?
  end

  test "name should be present" do
    @teacher.name = "    "
    assert_not @teacher.valid?
  end

  test "email should be present" do
    @teacher.email = "   "
    assert_not @teacher.valid?
  end

  test "address should be present" do
    @teacher.address = "   "
    assert_not @teacher.valid?
  end

  test "phone number should be present" do
    @teacher.phone_number = "    "
    assert_not @teacher.valid?
  end

  test "name should not be too long" do
    @teacher.name = "a" * 51
    assert_not @teacher.valid?
  end

  test "email should not be too long" do
    @teacher.email = "a" * 200 + "@gmail.com"
    assert_not @teacher.valid?
  end

  test "address should not be too long" do
    @teacher.address = "a" * 400
    assert_not @teacher.valid?
  end

  test "phone number should not be too long" do
    @teacher.phone_number = "1" * 12
    assert_not @teacher.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[teacher@gmail.com teacher@yahoo.com]
    valid_addresses.each do |valid_address|
      @teacher.email = valid_address
      assert @teacher.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @teacher.email = invalid_address
      assert_not @teacher.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_teacher = @teacher.dup
    duplicate_teacher.email = @teacher.email.upcase
    @teacher.save
    assert_not duplicate_teacher.valid?
  end

  test "phone number addresses should be unique" do
    duplicate_teacher = @teacher.dup
    @teacher.save
    assert_not duplicate_teacher.valid?
  end

  test "password should be present (nonblank)" do
    @teacher.password = @teacher.password_confirmation = " " * 6
    assert_not @teacher.valid?
  end

  test "password should have a minimum length" do
    @teacher.password = @teacher.password_confirmation = "a" * 5
    assert_not @teacher.valid?
  end
end
