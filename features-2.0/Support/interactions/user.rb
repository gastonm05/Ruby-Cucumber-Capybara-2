class User < InteractionBase
  attr_reader :username, :password, :display_name

  def initialize(account)
    @account_info ||= YAML.load(File.open('config/accounts_info.yml'))["#{account}"].symbolize_keys
    @username = @account_info[:email]
    @password = @account_info[:pwd]
    @display_name = @account_info[:name]
    @already_logged_in = false
  end

  def self.current
    @@current if defined?(@@current)
  end

  def self.current=(user_session)
    @@current = user_session
  end

  def visit_login
    session.get "#{target_base_url}/tools"
  end

  def logout
    session.get "#{target_base_url}/login/logout"
    User.current = nil
    # Capybara.current_session.driver.reset!
    # Capybara.reset_sessions!
  end

  def login
    page.fill_in 'user_session_login', with: username
    page.fill_in 'password_field', with: password
    page.click_button 'Sign in'
    User.current = self
    @already_logged_in = true
  end

  def logged_in?(as_any_user = false)
    return false if page.has_css?('form#new_user_session')
    return true if as_any_user

    element = Capybara.using_wait_time(5) do
      begin
                                    page.find('.organization-context .dropdown-toggle')
                                  rescue
                                    nil
                                  end
    end
    element && element.text =~ /#{display_name.downcase}/i
  end

  def already_logged_in?
    @already_logged_in == true
  end

  def ==(user)
    user.present? && username == user.username
  end
end

class Developer < InteractionBase
  attr_reader :username, :api_key

  def initialize(username, api_key)
    @username = username
    @api_key = api_key
  end
end

class MobileUser < InteractionBase
  attr_reader :username, :password

  def initialize(username, password)
    @username = username
    @password = password
  end
end

class ExternalUser
  attr_reader :client_token, :auth_callback_url

  def initialize(client_token, auth_callback_url)
    @client_token = client_token
    @auth_callback_url = auth_callback_url
  end
end
