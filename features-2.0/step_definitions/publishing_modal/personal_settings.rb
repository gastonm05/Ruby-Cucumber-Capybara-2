class PersonalSettings < BasePage
  def initialize(page, _url = nil)
    @page = page
  end

  def start_setting
    @page.find(input_elements[:settings]).click
  end

  def personal_setting
    wait_for_css(input_elements[:personal_settings])
    @page.find(input_elements[:personal_settings]).click
  end

  #######################################
  #
  #   Template related
  #
  #######################################
  def templates
    @page.find(input_elements[:templates], text: 'Templates').click
  end

  def go_to_templates_page
    start_setting
    personal_setting
    templates
  end

  def create_template
    @page.find(input_elements[:create_template]).click
  end

  def add_template_info
    template_name = Faker::Lorem.sentence
    @page.find(input_elements[:template_name]).set(template_name)
    @page.find(input_elements[:template_message]).set(Faker::Lorem.sentence)
    @page.find(input_elements[:template_save]).click
    template_name
  end

  def check_template(temp_name)
    @page.find(input_elements[:template_item], text: "#{temp_name}")
  end

  def get_templates
    @page.all(input_elements[:template_item])
  end

  def delete_template(temp_name)
    @page.find(input_elements[:template_item], text: "#{temp_name}").find(input_elements[:template_delete]).click
    @page.find(input_elements[:template_continue_delete]).click
  end

  def delete_all_templates
    templates = get_templates
    templates.each do |template|
      template.find(input_elements[:template_delete]).click
      @page.find(input_elements[:template_continue_delete]).click
    end
    puts '[INFO] : There is no more templates on the current page to delete'
  end

  def select_template(temp_name)
    @page.find(input_elements[:use_publishing_template]).click # template
    @page.find(input_elements[:template_dropdown]).click # click the dropdown
    @page.find(input_elements[:template_dropdown_item], text: "#{temp_name}").click # select the template
  end

  #######################################
  #
  #   URL related
  #
  #######################################
  def url_shortening
    wait_for_css(input_elements[:url_shortening])
    @page.find(input_elements[:url_shortening]).click
  end

  def set_custom_service(customize_service)
    @page.find(input_elements[:custom_shorten_service]).set(customize_service)
    @shorten_service_button = @page.find(input_elements[:custom_shorten_set].replace_key(customize_service))
    @page.find(input_elements[:custom_shorten_set].replace_key(customize_service)).click
  end

  def set_url_service(shorten_service_name)
    @shorten_service_button = @page.find(input_elements[:shorten_button].replace_key(shorten_service_name))
    @shorten_service_button.click unless self.default_shortening?(shorten_service_name)
  end

  def default_shortening?(_shorten_service_name)
    class_values = @shorten_service_button[:class]
    class_values.include? 'vh-disabled'
  end

  #######################################
  #
  #   Facebook related
  #
  #######################################
  def facebook
    wait_for_css(input_elements[:facebook])
    @page.find(input_elements[:facebook]).click
    wait_for_css(input_elements[:facebook_search_input])
  end
end
