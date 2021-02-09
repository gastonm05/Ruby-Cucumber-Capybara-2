# You should edit this file with the browsers you wish to use
# For options, check out http://saucelabs.com/docs/platforms
require 'capybara/rails'
require 'fileutils'

Capybara.default_selector = :css
Capybara.app = Rack::ShowExceptions.new(AutomatedQa::Application)

if ENV['HEADLESS'].to_s == 'false'
  require 'capybara/firebug'
  Capybara.javascript_driver = :selenium
end

if ENV['SAUCE'].to_s == 'true'

  require 'sauce'
  require 'sauce/capybara'
  require 'sauce/cucumber'

  Capybara.default_driver = :sauce
  Capybara.javascript_driver = :sauce

  if ENV['CI_CONFIG'].to_s == 'true'
    puts 'Running with CI configuration'
    Sauce.config do |config|
      config[:public] = 'private'
    end
  else
    puts 'Running with App configuration'
    Sauce.config do |config|
      # config[:os] = "Windows 7"
      # config[:browser] = "Firefox"
      # config[:browser_version] = "23"

      config[:browsers] = [
        # ["OS X 10.6", "Firefox", '21'],
        # ["OS X 10.6", "Chrome", nil],
        # ["Windows 8", "Chrome", nil],
        ['Windows 8', 'Internet Explorer', '10'],
        # ["Windows 7","Internet Explorer","9"],
        # ["Windows 7","Firefox","23"],
        # ["Windows 8","Safari","10"]
      ]
      config[:job_name] = "#{ENV['JOB_NAME']}_with_sauce"
      config[:public] = 'private'
    end
  end
else
  Capybara.javascript_driver = :javascript
  Capybara.default_driver = Capybara::Selenium::Driver.new(browser: :firefox, profile: 'default')
end

if ENV['MOBILE'].to_s == 'true'
  def mobile_app_path
    File.join(File.dirname(__FILE__), '../../', ENV['MOBILE_APP_PATH'])
  end

  def capabilities
    {
      'browserName' => 'iOS',
      'platform' => 'Mac',
      'version' => '6.0',
      'app' => mobile_app_path
    }
  end

  def appium_server
    ENV['APPIUM_HOST'] || 'http://127.0.0.1:4723/wd/hub'
  end

  def reset_mobile_driver!
    Capybara.session_name = Time.now.to_s
    Capybara.default_driver = :selenium_mobile
    Capybara.register_driver :selenium_mobile do |app|
      Capybara::Selenium::Driver.new(app, browser: :remote, url: appium_server, desired_capabilities: capabilities)
    end
  end

  reset_mobile_driver!
end

if ENV['USE_CHROME'].to_s == 'true'
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome)
  end
end

Capybara.default_wait_time = 120

# Capybara.default_host = 'localhost'

Capybara.run_server = false

# This hack is to exploit Capybara's design flaw and not reset the session
# (it can't reset if we went to about:blank before the next scenario - that is what we need to speed up tests)
#Modified by Fernando Gallo
After do |scenario|
  browser = Capybara.current_session.driver.browser
  if scenario.failed?
    dir_name = "screenshots/#{(Time.now).strftime("%Y%m%d_%H%M")}"
    FileUtils::mkdir_p dir_name unless File.exists?(dir_name)
    #Dir::mkdir(dir_name) unless File.directory?(dir_name)
    screenshot = "./#{dir_name}/FAILED_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
    browser.save_screenshot(screenshot)
    embed screenshot, 'image/png'
  end
  if browser.respond_to?(:clear_cookies)
    # Rack::MockSession
    browser.clear_cookies
  elsif browser.respond_to?(:manage) and browser.manage.respond_to?(:delete_all_cookies)
    # Selenium::WebDriver
    browser.manage.delete_all_cookies
  else
    raise "Don't know how to clear cookies. Weird driver?"
  end
  #Capybara.current_session.driver.browser.navigate.to('about:blank')
end
#After do
#  Capybara.current_session.driver.browser.navigate.to('about:blank')
#end
