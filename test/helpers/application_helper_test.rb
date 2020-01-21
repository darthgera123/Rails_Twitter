require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
	test "full_helper" do
		assert_equal full_title, "Rails Twitter"
		assert_equal full_title("Help "), "Help | Rails Twitter"
		
	end
end