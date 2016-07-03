module OurModule

  def register_user
    @driver.find_element(:class, 'register').click

    @wait.until { @driver.find_element(:id, 'user_login').displayed? }

    @login = ('rita' + rand(99999).to_s)

    @password1 = 'Qwerty1'

    @driver.find_element(:id, 'user_login').send_keys @login
    @driver.find_element(:id, 'user_password').send_keys 'Qwerty1'
    @driver.find_element(:id, 'user_password_confirmation').send_keys 'Qwerty1'
    @driver.find_element(:id, 'user_firstname').send_keys 'vlbvwk'
    @driver.find_element(:id, 'user_lastname').send_keys 'vlbvwk'
    @driver.find_element(:id, 'user_mail').send_keys(@login + '@vw.com')

    @driver.find_element(:name, 'commit').click
    @login
  end

  def logout_user
    @driver.find_element(:class, 'logout').click
  end

  def login_user
    @driver.find_element(:class, 'login').click
    @driver.find_element(:id, 'username').send_keys @login
    @driver.find_element(:id, 'password').send_keys 'Qwerty1'
    @driver.find_element(:name, 'login').click
  end

  def change_password
    password2 = 'Qazwsx1'
    @driver.find_element(:class, 'my-account').click
    @driver.find_element(:class, 'icon-passwd').click
    @driver.find_element(:id, 'password').send_keys @password1
    @driver.find_element(:id, 'new_password').send_keys password2
    @driver.find_element(:id, 'new_password_confirmation').send_keys password2
    @driver.find_element(:name, 'commit').click
  end

  def create_project
    project_name = 'project' + rand(99999).to_s
    @driver.find_element(:class, 'projects').click
    @driver.find_element(:class, 'icon-add').click
    @driver.find_element(:id, 'project_name').send_keys project_name
    @driver.find_element(:name, 'commit').click
  end

  def add_user_to_project
    @user1 = register_user
    logout_user
    register_user
    create_project
    @driver.find_element(:id, 'tab-members').click
    @driver.find_element(:xpath, "//a[text()='New member']").click
    @wait.until { @driver.find_element(:id, 'principal_search').displayed? }
    @driver.find_element(:id, 'principal_search').send_keys @user1
    @wait.until { @driver.find_element(:class, "items").text == '(1-1/1)' }
    @driver.find_element(:xpath, ".//*[@id='principals']/label/input").click
    @driver.find_element(:xpath, ".//*[@class='roles-selection']//*[@value='4']").click
    @driver.find_element(:id, 'member-add-submit').click
    @wait.until { @driver.find_element(:xpath, "//tbody/tr[2]/td[@class='name user']/a").displayed? }
  end

  def edit_user_roles
    @driver.find_element(:xpath, "//tbody/tr[2]/td[@class='buttons']/a[@class='icon icon-edit']").click
    @driver.find_element(:xpath, "//tbody/tr[2]/td[@class='roles']//input[@value='3']").click
    @driver.find_element(:xpath, "//tbody/tr[2]/td[@class='roles']//input[@value='5']").click
    @driver.find_element(:xpath, "//tbody/tr[2]/td[@class='roles']//input[@value='Save']").click
    @wait.until { @driver.find_element(:xpath, "//tbody/tr[2]/td[@class='roles']/span").displayed? }
  end

  def create_project_version
    @driver.find_element(:id, 'tab-versions').click
    @driver.find_element(:xpath, '//a[text()="New version"]').click

    @version_name = 'version' + rand(99999).to_s
    @driver.find_element(:id, 'version_name').send_keys @version_name
    @driver.find_element(:name, 'commit').click
  end

  def create_bug
    @driver.find_element(:class, 'new-issue').click

    @issue_subject = 'subject' + rand(99999).to_s
    @driver.find_element(:id, 'issue_subject').send_keys @issue_subject
    @driver.find_element(:name, 'commit').click
  end

  def create_feature
    @driver.find_element(:class, 'new-issue').click
    @driver.find_element(:id, "issue_tracker_id").send_keys 'Feature'

    @issue_subject = 'subject' + rand(99999).to_s
    @driver.find_element(:id, 'issue_subject').send_keys @issue_subject
    @driver.find_element(:name, 'commit').click
  end

  def create_support
    @driver.find_element(:class, 'new-issue').click
    @driver.find_element(:id, "issue_tracker_id").send_keys 'Support'

    @issue_subject = 'subject' + rand(99999).to_s
    @driver.find_element(:id, 'issue_subject').send_keys @issue_subject
    @driver.find_element(:name, 'commit').click
  end
end