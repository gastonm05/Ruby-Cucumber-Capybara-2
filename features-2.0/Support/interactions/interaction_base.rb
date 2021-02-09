class InteractionBase
  def session
    InteractionBase.browser_session
  end

  def page
    Capybara.current_session
  end

  def self.browser_session
    Capybara.current_session.driver.browser
  end
end
