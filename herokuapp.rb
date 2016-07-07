module Herokuapp

  def hover_first_element
    @wait.until { @driver.find_element(css: 'a[href="/hovers"]').displayed? }
    @driver.find_element(css: 'a[href="/hovers"]').click
    @wait.until { @driver.find_element(css: '.example>.figure:first-of-type>img').displayed? }
    icon = @driver.find_element(css: '.example>.figure:first-of-type>img')
    @driver.action.move_to(icon).perform
  end

  def drag_and_drop_element
    @driver.find_element(css: 'a[href="/drag_and_drop"]').click
    @wait.until { @driver.find_element(id: 'column-a').displayed? }
    dnd_javascript = File.read(Dir.pwd + '/dnd.js')
    @driver.execute_script(dnd_javascript+"$('#column-a').simulateDragDrop({ dropTarget: '#column-b'});")
  end

  def select_dropdown
    @driver.find_element(css: 'a[href="/dropdown"]').click
    @wait.until { @driver.find_element(id: 'dropdown').displayed? }
    @driver.find_element(id: 'dropdown').find_element(css: "option[value='1']").click
  end

  def typing_text_in_iframe
    @driver.find_element(css: 'a[href="/frames"]').click
    @wait.until { @driver.find_element(css: 'a[href="/iframe"]').displayed? }
    @driver.find_element(css: 'a[href="/iframe"]').click
    @wait.until { @driver.find_element(id: 'mceu_13').displayed? }
    iframe = @driver.find_element(:id, 'mce_0_ifr')
    @driver.switch_to.frame iframe
    @driver.find_element(id: "tinymce").send_keys ' Testing iframes'
  end

  def pressing_key
    @driver.find_element(css: 'a[href="/key_presses"]').click
    @driver.action.send_keys(:enter).perform
  end

  def using_jquery_ui_menu
    @driver.find_element(css: 'a[href="/jqueryui/menu"]').click
    @driver.find_element(id: 'ui-id-3').click
    @wait.until { @driver.find_element(id: 'ui-id-8').displayed? }
    @driver.find_element(id: 'ui-id-8').click
    @wait.until { @driver.find_element(css: ".example>h3").displayed? }
  end

  def check_javascript_alert
    @driver.find_element(css: 'a[href="/javascript_alerts"]').click
    @wait.until { @driver.find_element(css: "button[onclick='jsAlert()']").displayed? }
    @driver.find_element(css: "button[onclick='jsAlert()']").click
    @driver.switch_to.alert.accept
  end

  def check_javascript_confirm
    @driver.find_element(css: 'a[href="/javascript_alerts"]').click
    @wait.until { @driver.find_element(css: "button[onclick='jsConfirm()']").displayed? }
    @driver.find_element(css: "button[onclick='jsConfirm()']").click
    @driver.switch_to.alert.accept
  end

  def check_javascript_prompt
    @driver.find_element(css: 'a[href="/javascript_alerts"]').click
    @wait.until { @driver.find_element(css: "button[onclick='jsPrompt()']").displayed? }
    @driver.find_element(css: "button[onclick='jsPrompt()']").click
    @driver.switch_to.alert.send_keys '123'
    @driver.switch_to.alert.accept
  end

  def open_multiple_windows
    @driver.find_element(css: 'a[href="/windows"]').click
    @wait.until { @driver.find_element(css: ".example>a").displayed? }
    @driver.find_element(css: ".example>a").click
    @driver.switch_to.window(@driver.window_handles.last)
  end

end