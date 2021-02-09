class FacebookMentioningPage < BasePage
  def initialize(page)
    @page = page
    @page_added = nil
  end

  def search_for_page(account)
  	@page.find(input_elements[:search_input]).set(account)
  	return wait_for_css(input_elements[:new_entries])
  	#return wait_until_css_is_not_visible(input_elements[:spinner_div])
  end

  def has_already_added_pages?
    return @page.all(input_elements[:old_entries]).size > 0
  end

  def search_for_already_added_page(account)
    @page.find(input_elements[:search_already_added_input]).set(account)
    return wait_for_css(input_elements[:old_entries])
  end

  def get_entries(section_locator)
  	case section_locator
  	when "new pages"
  	  return @page.all(input_elements[:new_entries])
  	when "existing pages"
  	  return @page.all(input_elements[:old_entries])
  	else
  	  return nil
  	end
  end

  def select_pages(page_index, section_locator)
  	elements = get_entries(section_locator)
  	elements.each_with_index do |elem, index|
  	  if index == (page_index.to_i - 1)
  	  	@page_added = elem.text
  	  	return elem.click 
  	  end
  	end
  	return false
  end

  def remove_pages(page_index, section_locator)
    elements = get_entries(section_locator)
    elements.each_with_index do |elem, index|
      if index == (page_index.to_i - 1) && @page_added.eql?(elem.text)
        return elem.click 
      end
    end
    return false
  end

  def selected_page_on_section(section_locator)
  	wait_for_css(input_elements[:old_entries])
  	elements = get_entries(section_locator)
  	elements.each do |elem|
  		puts "#{elem.text} - #{@page_added}"
  	  return true if elem.text.include?(@page_added)
  	end
  	return false
  end

end