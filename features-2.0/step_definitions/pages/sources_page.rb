class SourcesPage < BasePage
  @@element_array = []

  # TODO: add confirmation of successful completion of adding FB account

  def initialize(page, _url = nil)
    @page = page
    #@page.click_button('Continue') if @page.has_text?('Maintainence')
    @page.visit(target_base_url + '/sources')
  end

  def add_new_source
    @page.find(input_elements[:add_source_button]).click
  end

  def click_create
    wait_for_css(input_elements[:create_button])
    @page.find(input_elements[:create_button]).click
  end

  def connect_twitter(username, password)
    @page.find(input_elements[:add_source_button]).click
    @page.find(input_elements[:select_newSourceType_twitter]).click
    @page.fill_in('username_or_email', with: username)
    @page.fill_in('password', with: password)
    @page.click_button('Authorize app')
    @page.has_text?('connected')
  end

  def connect_facebook(username, password, secondary_account)
    @page.find(input_elements[:add_source_button]).click
    @page.find(input_elements[:select_newSourceType_facebook]).click
    @page.has_text?('Facebook Login')
    @page.fill_in('email', with: username)
    @page.fill_in('pass', with: password)
    @page.find(input_elements[:fb_accept_button]).click
    if @page.has_text?('will receive the following info') # This does not let the app post to Facebook
      @page.find(input_elements[:fb_confim_acceptance]).click
    end
    if @page.has_text?('would like to post to Facebook')
      @page.find(input_elements[:fb_confim_acceptance]).click
    end
    if @page.has_text?('would like to manage your Pages')
      @page.find(input_elements[:fb_confim_acceptance]).click
    end
    @page.find(input_elements[:facebook_account]).click
    for i in Capybara.current_session.all('li[data-vh-id="source"]')
      @@element_array << i.text
    end
    unless @@element_array.include?(secondary_account)
      @page.find('li[data-searchable-label=' + '"' + secondary_account + '"' + ']').click
    end
    @@element_array.clear
  end

  def connect_google(username, password)
    @page.find(input_elements[:add_source_button]).click
    @page.find(input_elements[:select_newSourceType_google]).click
    @page.fill_in('email', with: username)
    @page.find(input_elements[:google_userNext_button]).click
    @page.fill_in('Passwd', with: password)
    @page.find(input_elements[:google_SignIn_button]).click
    sleep 3 # wait accept button to be enabled
    @page.find(input_elements[:google_accept_button]).click
    run_patiently(10) { @page.has_text?('connected') }
  end

  def connect_tumblr(username, password)
    @page.find(input_elements[:add_source_button]).click
    @page.find(input_elements[:select_newSourceType_tumblr]).click
    @page.fill_in('signup_email', with: username)
    @page.fill_in('signup_password', with: password)
    @page.find(input_elements[:tumblr_logIn_button]).click
    @page.find(input_elements[:tumblr_accept_button]).click
  end

  def connect_wordpress(username, password)
    @page.find(input_elements[:add_source_button]).click
    @page.find(input_elements[:select_newSourceType_wordpress]).click
    @page.fill_in('username', with: username)
    @page.fill_in('password', with: password)
    @page.find(input_elements[:wordpress_logIn_button]).click
    @page.find(input_elements[:wordpress_accept_button]).click
  end

  def connect_foursquare(username, password)
    @page.find(input_elements[:add_source_button]).click
    @page.find(input_elements[:select_newSourceType_foursquare]).click
    @page.fill_in('username', with: username)
    @page.fill_in('password', with: password)
    @page.find(input_elements[:foursquare_logIn_button]).click
  end

  def connect_instagram(username, password)
    @page.find(input_elements[:add_source_button]).click
    @page.find(input_elements[:select_newSourceType_instagram]).click
    @page.fill_in('id_username', with: username)
    @page.fill_in('id_password', with: password)
    @page.find(input_elements[:instagram_logIn_button]).click
    if @page.has_text?('is requesting to do the following')
      @page.find(input_elements[:instagram_accept_button]).click
    end
  end

  def connect_pinterest(username, password)
    @page.fill_in('username_or_email', with: username)
    @page.fill_in('password', with: password)
    @page.find(input_elements[:pinterest_logIn_button]).click
    wait_for_css(input_elements[:pinterest_accept_button])
    @page.find(input_elements[:pinterest_accept_button]).click
  end

  def delete_source(account)
    Capybara.current_session.all('li[data-vh-id="source"]').each do |element|
      next unless element.text.include?(account)
      element.find(input_elements[:more_account_options]).click
      @page.find(input_elements[:delete_account]).click
    end
    @page.has_text?('successfully deleted.')
  end

  def add_foursquare(user_alias)
    for i in Capybara.current_session.all('li[data-vh-id="source"]')
      @@element_array << i.text
    end
    unless @@element_array.include?(user_alias)
      @page.find(input_elements[:add_source_button]).click
      @page.find(input_elements[:select_newSourceType_foursquare]).click
      @page.find('li[data-searchable-label=' + '"' + user_alias + '"' + ']').click
      @page.find(input_elements[:publicOrg_add_source]).click
      sleep(10)
      run_patiently(10) { @page.has_text?('Your source has been added.') }
    end
    @@element_array.clear
  end

  def add_twitter(user_alias)
    for i in Capybara.current_session.all('li[data-vh-id="source"]')
      @@element_array << i.text
    end
    unless @@element_array.include?(user_alias + ' Account')
      @page.find(input_elements[:add_source_button]).click
      @page.find(input_elements[:select_newSourceType_twitter]).click
      @page.find('li[data-searchable-label=' + '"' + user_alias + '"' + ']').click
      @page.find(input_elements[:publicOrg_add_source]).click
      sleep(10)
      run_patiently(10) { @page.has_text?('Your source has been added.') }
    end
    @@element_array.clear
  end

  def add_facebook(user_alias)
    for i in Capybara.current_session.all('li[data-vh-id="source"]')
      @@element_array << i.text
    end
    unless @@element_array.include?(user_alias)
      @page.find(input_elements[:add_source_button]).click
      @page.find(input_elements[:select_newSourceType_facebook]).click
      @page.find('li[data-searchable-label=' + '"' + user_alias + '"' + ']').click
      @page.find(input_elements[:publicOrg_add_source]).click
      sleep(10)
      run_patiently(10) { @page.has_text?('Your source has been added.') }
      @page.find(input_elements[:sources_page]).click
      @page.find('li[data-searchable-label=' + '"' + user_alias + '"' + ']').click
    end
    @@element_array.clear
  end

  def add_google(user_alias)
    for i in Capybara.current_session.all('li[data-vh-id="source"]')
      @@element_array << i.text
    end
    unless @@element_array.include?(user_alias)
      @page.find(input_elements[:add_source_button]).click
      @page.find(input_elements[:select_newSourceType_google]).click
      @page.find('li[data-searchable-label=' + '"' + user_alias + '"' + ']').click
      @page.find(input_elements[:publicOrg_add_source]).click
      sleep(10)
      run_patiently(10) { @page.has_text?('Your source has been added.') }
    end
    @@element_array.clear
  end

  def add_instagram(user_alias)
    for i in Capybara.current_session.all('li[data-vh-id="source"]')
      @@element_array << i.text
    end
    unless @@element_array.include?(user_alias)
      @page.find(input_elements[:add_source_button]).click
      @page.find(input_elements[:select_newSourceType_instagram]).click
      @page.find('li[data-searchable-label=' + '"' + user_alias + '"' + ']').click
      @page.find(input_elements[:publicOrg_add_source]).click
      sleep(10)
      run_patiently(10) { @page.has_text?('Your source has been added.') }
    end
    @@element_array.clear
  end

  def add_wordpress(user_alias)
    for i in Capybara.current_session.all('li[data-vh-id="source"]')
      @@element_array << i.text
    end
    unless @@element_array.include?(user_alias)
      @page.find(input_elements[:add_source_button]).click
      @page.find(input_elements[:select_newSourceType_wordpress]).click
      @page.find('li[data-searchable-label=' + '"' + user_alias + '"' + ']').click
      @page.find(input_elements[:publicOrg_add_source]).click
      sleep(10)
      run_patiently(10) { @page.has_text?('Your source has been added.') }
    end
    @@element_array.clear
  end

  def add_tumblr(user_alias)
    for i in Capybara.current_session.all('li[data-vh-id="source"]')
      @@element_array << i.text
    end
    unless @@element_array.include?(user_alias)
      @page.find(input_elements[:add_source_button]).click
      @page.find(input_elements[:select_newSourceType_tumblr]).click
      @page.find('li[data-searchable-label=' + '"' + user_alias + '"' + ']').click
      @page.find(input_elements[:publicOrg_add_source]).click
      sleep(10)
      run_patiently(10) { @page.has_text?('Your source has been added.') }
    end
    @@element_array.clear
  end

  def add_pinterest(user_alias)
    for i in Capybara.current_session.all('li[data-vh-id="source"]')
      @@element_array << i.text
    end
    unless @@element_array.include?(user_alias)
      @page.find(input_elements[:add_source_button]).click
      @page.find(input_elements[:select_newSourceType_pinterest]).click
      @page.find('li[data-searchable-label=' + '"' + user_alias + '"' + ']').click
      @page.find(input_elements[:publicOrg_add_source]).click
      sleep(10)
      run_patiently(10) { @page.has_text?('Your source has been added.') }
    end
    @@element_array.clear
  end

  def filter_facebook
    @page.find(input_elements[:facebook_account]).click
  end

  def filter_tumblr
    @page.find(input_elements[:tumblr_account]).click
  end

  def filter_twitter
    @page.find(input_elements[:twitter_account]).click
  end

  def filter_google
    @page.find(input_elements[:google_account]).click
  end

  def filter_wordpress
    @page.find(input_elements[:wordpress_account]).click
  end

  def filter_foursquare
    @page.find(input_elements[:foursquare_account]).click
  end

  def filter_instagram
    @page.find(input_elements[:instagram_account]).click
  end

  def filter_pinterest
    @page.find(input_elements[:pinterest_account]).click
  end

  #########################################
  #
  # Topic Profiles
  #
  #########################################

  def delete_topic_profile
    sources = @page.all(input_elements[:sources])
    sources.each do |source|
      next unless source.text.include?(@topic_profile_name)
      source.find(input_elements[:source_dropdown_list]).click
      @page.find(input_elements[:source_delete_link]).click
      @page.find(input_elements[:continue_danger_button]).click
      return true
    end
  end

  def select_option(option)
    case option.downcase
    when 'topic profile'
      @page.find(input_elements[:select_newSourceType_topic_profile]).click
    end
  end

  def is_topic_profile_present?
    @page.has_content?(@topic_profile_name)
  end

  def enter_topic_profile_name=(value)
    @topic_profile_name = value
    wait_for_css(input_elements[:topic_profile_name])
    @page.find(input_elements[:topic_profile_name]).set(value)
  end

  def enter_terms(times)
    for i in 0..(times.to_i - 1)
      word = Faker::Lorem.word
      @page.find(input_elements[:topic_profile_term]).set("#{word}\n")
    end
  end

  def remove_terms(times)
    delete_links = @page.all(input_elements[:topic_profile_term_delete])
    for i in 0..(times.to_i - 1)
      delete_links[i].click
    end
  end

  def authorize_pinterest
    @page.find(input_elements[:pinterest_authorize_button]).click
  end

  def verify_account_added(state)
    @page.has_text?("Your Pinterest Personal Account has been #{state}.")
  end

  def select_pinterest
    @page.find(input_elements[:select_newSourceType_pinterest]).click
  end
  def verify_no_sources
    @page.has_text?("No sources found.")
  end

  def click_sources_button
    @page.find(input_elements[:add_source_public]).click
  end

  def add_new_source_button
    @page.find(input_elements[:add_a_new_source]).click
  end

  def add_sources_button
    @page.find(input_elements[:add_source_green_button]).click
  end

  def verify_source_added
    @page.has_text?(" Your source has been added.")
  end

  def verify_source_deleted
    @page.has_text?("Source was successfully deleted.")
  end

  def view_platform(account_name)
    Capybara.current_session.all('li[data-vh-id="source"]').each do |element|
      next unless element.text.include?(account_name)
      element.find(input_elements[:more_account_options]).click
      @page.find('a[href="https://pinterest.com/' + account_name + '"' + ']').click
      break
      end
  end

  def choose_account(account)
    @page.find('li[data-searchable-label=' + '"' + account + '"' + ']').click
  end
end