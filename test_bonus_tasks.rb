require 'test/unit'
require 'selenium-webdriver'
require_relative 'herokuapp'

class TestBonusTasks < Test::Unit::TestCase
  include Herokuapp

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @driver.navigate.to 'https://the-internet.herokuapp.com/'
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  end

  def test_hover
    hover_first_element
    assert(@driver.find_element(css: '.figure:first-of-type>.figcaption>a').displayed?)
  end

  def test_drag_and_drop
    drag_and_drop_element
    expected_text = 'A'
    actual_text = @driver.find_element(css: "#column-b>header").text
    assert_equal(expected_text, actual_text)
  end

  def test_dropdown
    select_dropdown
    assert(@driver.find_element(css: "option[value='1']").selected?)
  end

  def test_iframes
    typing_text_in_iframe
    expected_text = "Your content goes here. Testing iframes"
    actual_text = @driver.find_element(css: "#tinymce>p").text
    assert_equal(expected_text, actual_text)
  end

  def test_key_press
    pressing_key
    expected_text = "You entered: ENTER"
    actual_text = @driver.find_element(id: 'result').text
    assert_equal(expected_text, actual_text)
  end

  def test_jquery_ui_menu
    using_jquery_ui_menu
    expected_text = "JQuery UI"
    actual_text = @driver.find_element(css: ".example>h3").text
    assert_equal(expected_text, actual_text)
  end

  def test_javascript_alert
    check_javascript_alert
    expected_text = "You successfuly clicked an alert"
    actual_text = @driver.find_element(id: 'result').text
    assert_equal(expected_text, actual_text)
  end

  def test_javascript_confirm
    check_javascript_confirm
    expected_text = "You clicked: Ok"
    actual_text = @driver.find_element(id: 'result').text
    assert_equal(expected_text, actual_text)
  end

  def test_javascript_prompt
    check_javascript_prompt
    expected_text = "You entered: 123"
    actual_text = @driver.find_element(id: 'result').text
    assert_equal(expected_text, actual_text)
  end

  def test_multiple_windows
    open_multiple_windows
    expected_text = "New Window"
    actual_text = @driver.find_element(css: '.example>h3').text
    assert_equal(expected_text, actual_text)
  end

  def teardown
    @driver.quit
  end
end