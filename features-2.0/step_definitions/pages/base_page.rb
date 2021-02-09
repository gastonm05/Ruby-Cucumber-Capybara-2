class BasePage
  def input_elements
    @input_elements = YAML.load(File.open(yml_file)).symbolize_keys
  end

  def yml_file
    "config/#{self.class.to_s.underscore}.yml"
  end

  def make_uniq(message)
    message + ' ' + DateTime.now.to_s
  end

  # #@author Fernando Gallo
  # Desc: Search for element every second until time up
  #
  # Params:
  #   wait_time   		- The max time to wait, if null defaults to 10
  #   element_locator	- The CSS of the element we are looking for
  #
  # Return:
  #   true if the element is present
  ##
  def wait_for_css(wait_time = 10, element_locator)
    i = 0
    while i < wait_time && !@page.has_css?(element_locator)
      i += 1
      sleep(1)
    end
    @page.has_css?(element_locator)
  end

  # #@author Fernando Gallo
  # Desc: Returns true when the element is not present
  #
  # Params:
  #   wait_time       - The max time to wait, if null defaults to 10
  #   element_locator - The CSS of the element we are looking for
  #
  # Return:
  #   true if the element is not present
  ##
  def wait_until_css_is_gone(wait_time = 10, element_locator)
    i = 0
    while i < wait_time && @page.has_css?(element_locator)
      i += 1
      sleep(1)
    end
    !@page.has_css?(element_locator)
  end

  # #@author Fernando Gallo
  # Desc: Reloads the page
  #
  ##
  def reload_page
    @page.driver.browser.navigate.refresh
  end
end
