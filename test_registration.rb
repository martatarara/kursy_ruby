require 'test/unit'
require 'selenium-webdriver'
require_relative 'our_module'

class TestRegistration < Test::Unit::TestCase
  include OurModule

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @driver.navigate.to 'http://demo.redmine.org'
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  end

  def test_register
    register_user

    expected_text = 'Your account has been activated. You can now log in.'
    actual_text = @driver.find_element(:id, 'flash_notice').text
    assert_equal(expected_text, actual_text)
  end

  def test_log_out
    register_user
    logout_user

    login_button = @driver.find_element(:class, 'login')

    assert(login_button.displayed?)
  end

  def test_login
    register_user
    logout_user
    login_user

    logout_button = @driver.find_element(:class, 'logout')

    assert(logout_button.displayed?)
  end

  def test_change_password
    register_user
    change_password

    expected_text = 'Password was successfully updated.'
    actual_text = @driver.find_element(:id, 'flash_notice').text
    assert_equal(expected_text, actual_text)
  end

  def test_create_project
    register_user
    create_project

    expected_text = 'Successful creation.'
    actual_text = @driver.find_element(:id, 'flash_notice').text
    assert_equal(expected_text, actual_text)
  end

  def test_add_user_to_project
    add_user_to_project

    expected_role = "Developer"
    actual_role = @driver.find_element(:xpath, "//tbody/tr[2]/td[@class='roles']/span").text
    assert_equal(expected_role, actual_role)

    expected_name = 'vlbvwk vlbvwk'
    actual_name = @driver.find_element(:xpath, "//tbody/tr[2]/td[@class='name user']/a").text
    assert_equal(expected_name, actual_name)
  end

  def test_edit_user_roles
    add_user_to_project
    edit_user_roles

    expected_role = "Manager, Developer, Reporter"
    actual_role = @driver.find_element(:xpath, "//tbody/tr[2]/td[@class='roles']/span").text
    assert_equal(expected_role, actual_role)
  end

  def test_create_project_version
    register_user
    create_project
    create_project_version

    expected_text = 'Successful creation.'
    actual_text = @driver.find_element(:id, 'flash_notice').text
    assert_equal(expected_text, actual_text)

    expected_name = @version_name
    actual_name = @driver.find_element(:xpath, ".//*[@class='version odd open ']/td/a").text
    assert_equal(expected_name, actual_name)
  end

  def test_create_all_types_of_issues
    register_user
    create_project
    create_bug

    expected_text = 'Issue #'
    actual_text = @driver.find_element(:id, 'flash_notice').text
    assert_include(actual_text, expected_text)

    create_feature
    expected_text = 'Issue #'
    actual_text = @driver.find_element(:id, 'flash_notice').text
    assert_include(actual_text, expected_text)

    create_support
    expected_text = 'Issue #'
    actual_text = @driver.find_element(:id, 'flash_notice').text
    assert_include(actual_text, expected_text)

    @driver.find_element(:xpath, "//a[@class='issues selected']").click

    expected_text = 'Bug'
    actual_text = @driver.find_element(:xpath, "//tbody/tr[3]/td[@class='tracker']").text
    assert_include(actual_text, expected_text)

    expected_text = 'Feature'
    actual_text = @driver.find_element(:xpath, "//tbody/tr[2]/td[@class='tracker']").text
    assert_include(actual_text, expected_text)

    expected_text = 'Support'
    actual_text = @driver.find_element(:xpath, "//tbody/tr[1]/td[@class='tracker']").text
    assert_include(actual_text, expected_text)

  end

  def teardown
    @driver.quit
  end
end