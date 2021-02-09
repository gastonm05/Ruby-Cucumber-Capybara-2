class LoginPage < BasePage
  attr_reader :email, :password, :url

  def initialize(page, url)
    @page = page
    @url = url
    @page.visit(@url)
  end

  def email=(value)
    @email = value
    @page.find(input_elements[:email]).set(@email)
  end

  def password=(value)
    @password = value
    @page.find(input_elements[:password]).set(@password)
  end

  def login
    @page.click_button(input_elements[:submit_button])
    #if @page.has_text?('Maintenance')
    #  @page.find(input_elements[:continue]).click
    #end
  end

  def quick_login(display_name)
    @page.click_button(input_elements[:submit_button])
    unless logged_in?(display_name)
      if @page.has_text?('Maintenance')
        @page.find(input_elements[:continue]).click
        return logged_in?(display_name)
      else
        return false
      end
    end
    true
  end

  def switch_organization(organization)
    @page.find(input_elements[:organizations_menu]).click
    @page.find("li[data-searchable-label=\"#{organization.downcase}\"] a").click
    fail "Switching to #{organization} failed" unless @page.has_content?(organization)
  end

  def logged_in?(display_name)
    @page.has_content?(display_name)
  end

  def logout
    @page.visit(target_base_url + '/login/logout')
  end
end
