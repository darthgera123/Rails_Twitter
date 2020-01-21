require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user = User.new(name: "Abc",email: "abc@example.cunt",
  		password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
  	assert @user.valid?
  end

  test "email should be valid" do
  	@user.email = "     "
    assert_not @user.valid?

  end

  test "name should be valid" do
  	@user.name = "  "
  	assert_not @user.valid?
  end

  test "name should be small" do
  	@user.name = "a"*100
  	assert_not @user.valid?
  end

  test "email should be small" do
  	@user.email = "a"*255 + "@gmail.com"
  	assert_not @user.valid?
  end

  test "email should be real" do
  	invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
  	end

  end

  test "email should be unique" do
  duplicate_user = @user.dup
  # dupy.email = @user.email.upcase
  @user.save
  # Now dupy email shouldnt be valid
  assert_not duplicate_user.valid?
	end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "password should not be blanks" do
  	@user.password = @user.password_confirmation=""*6
  	assert_not @user.valid?
  end

  test "password should be long" do
  	@user.password = @user.password_confirmation = "a"*5
  	assert_not @user.valid?
  end

end
