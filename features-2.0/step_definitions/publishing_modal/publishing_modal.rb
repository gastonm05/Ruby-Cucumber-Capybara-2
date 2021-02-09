class PublishingModal < BasePage
  include MonkeyPatch

  attr_reader :accounts, :message, :link, :campaign_tracking
  attr_accessor :message_key

  def initialize(page, _url = nil)
    @logger = Logger.new(STDOUT)
    @page = page
    @message_content = ''
    @message_id_published = ''
    @assertdata = {}
  end

  def start_publish
    @page.find(input_elements[:publish_button]).click
  end

  def publish_a_message
    @page.find_link(input_elements[:publish_message]).click
  end

  def upload_image
    @page.find(input_elements[:upload_image]).click
  end

  def attach_image_url(url)
    @page.find(input_elements[:attach_image_url]).click
    @page.find(:css, input_elements[:input_image_url]).set(url)
  end

  def attach_file
    @page.find(:css, input_elements[:attach_file]).click
  end

  def attach_image_uploading(image_name)
    @page.attach_file('file', "#{Rails.root}/features-2.0/Support/images/#{image_name}", visible: false)
  end

  def board_name(board_name)
    #byebug
    #@page.find(input_elements[:board_name]).set(board_name)
    #fix this asap
    self.set_board_name(board_name)
  end

  def check_schedule_time
    data_period = Time.now.strftime("%Y-%m-%dT%H")
    message = @page.find(input_elements[:schedule_message]).text
  end

  def set_board_name(desired_name)
    @page.find(input_elements[:board_name_link]).click
    @page.find(input_elements[:board_name_input]).set("#{desired_name}")
    @page.find(input_elements[:board_name_result]).click
  end

  def board_description(board_description)
    @page.find(input_elements[:board_description]).set(board_description)
  end

  def switch_selenium_page
    @page.driver.browser.switch_to().window(@page.driver.browser.window_handles.last)
  end

  def switchback_selenium_page
    @page.driver.browser.switch_to().window(@page.driver.browser.window_handles.first)
  end

  def click_board_name(board_name)
    @board_name = board_name
    @page.find('h2[class="title"]', text: "#{@board_name}").click
  end

  def verify_board_name(board_name)
    @board_name = board_name
    @page.has_css?('div[class="name"]', text: "#{@board_name}")
  end

  def click_edit_board
    @page.click_button('Edit board')
  end

  def close_browser
    @page.execute_script "window.close();"
  end

  def close_tab
    # Find our target window
    handle = @page.driver.find_window("viralheat qatest on Pinterest")
  end

  def verify_board_description_empty
      @page.has_content?("Enter the Board description ...")
  end

  def verify_board_summary(board_name)
    phrase = 'Publishing on Pinterest to the board "'+board_name+'".'
    found = @page.find(input_elements[:pinterest_summary]).text
    fail(ArgumentError.new("Expected '" + phrase + "' but found '" + found + "'")) unless phrase.eql?(found)
  end

  def get_messages
    @page.all(input_elements[:message])
  end

  def verify_message_calendar(description)
    messages = get_messages
    messages.each do |message|
      puts message
      return false unless message.text.include?(description)
    end
    return true
    puts 'Message found in calendar'
  end

  def enter_message(message)
    @page.find(input_elements[:message]).set(message)
  end

  def pick_mention
    byebug
    wait_for_css(input_elements[:facebook_mention_options])
    @page.find(input_elements[:facebook_mention_options]).click
  end

  def verify_board_description(board_description)
    @page.has_content?(board_description)
  end

  def click_delete_button
    @page.find(input_elements[:delete_button]).click
    @page.find(input_elements[:delete_button_sure]).click
   # @page.click_button('Delete board') #Confirms the delete
  end

  def select_account(account)
    @page.find(input_elements[:accounts_search_box]).click
    @page.find('li[data-searchable-label=' + '"' + account + '"' + ']').click
  end

  def login_pinterest_platform(username, password)
   # @page.find(input_elements[:pinterest_logIn_button3]).click
    @page.fill_in('email', with: username)
    @page.fill_in('password', with: password)
    @page.find(input_elements[:pinterest_logIn_button2]).click
  end

  # attach a set of images  simulating a drag and drop action using javascript
  def attach_multiple_images
    image_set = [image_path + 'book1.jpg',
                 image_path + 'classic1.jpg',
                 image_path + 'dolph1.jpeg',
                 image_path + 'nat2.jpeg',
                 image_path + 'nat5.jpeg',
                 image_path + 'nat15.jpeg']

    js_script = 'fileList = Array();'
    image_set.count.times do |i|
      @page.execute_script <<-JS
    ("fakeFileInput = window.$('<input/>').attr({id: 'fakeFileInput', name: 'file', type:'file', }).appendTo('body')");
    JS
      @page.attach_file('file', image_set[i], visible: false)
      js_script = "#{js_script} fileList.push(file#{i}.get(0).files[0]);"
    end
    @page.execute_script <<-JS
    ("var e = jQuery.Event('drop', { dataTransfer : { files : fileList } });$('.dropper')[0].dropper.listeners[0].events.drop(e)");
    JS
  end

  def verify_image(image_number)
    @page.has_content?("#{image_number} images will be attached to the post")
  end

  def verify_twitter_images
    @page.has_no_selector?('input[data-vh-id="uploader"]')
  end

  def verify_publish
    @page.has_content?('Your message will be sent in a few moments.')
  end

  def verify_twitter_limit
    @page.has_content?('Twitter supports only four images')
  end

  # delete just the first image attached
  def delete_image
    @page.first('span[data-vh-id="remove"]').click
  end

  def insert_album_name_fb(album_name)
    @page.fill_in 'Insert an album name for Facebook ...', with: album_name
  end

  def image_path
    Rails.root + 'features-2.0/Support/images/'
  end

  def fb_targeting
    @page.find('a[data-original-title="Audience targeting for Facebook pages"]').click
  end

  def select_target(target_country)
    @page.find(input_elements[:target_country]).set(target_country)
    @page.find(input_elements[:target_highlighted_country]).click
    @page.find(input_elements[:target_done]).click
    @page.has_content?('This message will be visible to a custom audience on Facebook Pages.')
  end

  def fb_targeting_message
    @page.has_content?('With Audience targeting enabled, only first picture will be published.')
  end

  def error_present
    return @page.has_content?("Unable to attach image. This image format is not supported, please upload a JPEG, GIF or PNG file.")
  end

  def done_image_attach
    @page.find(:css, input_elements[:done_image_attach]).click
  end

  def found_image_attached
    @page.all(:css, input_elements[:image_attached])
  end

  def remove_image
    @page.find(input_elements[:remove_image]).click
  end

  def no_image_attached?
    @page.has_no_selector?(input_elements[:image_exist])
  end

  def bulk_upload
    @page.find_link(input_elements[:bulk_upload]).click
  end

  def wordpress_blog_title=(title)
    @page.find(input_elements[:wordpress_blog_title]).set(title)
  end

  attr_writer :link

  def set_messages(messages_array)
    @message = messages_array
  end

  def message=(value)
    # This is to evaluate which locator use in this case
    # sometimes it uses a div and some others uses a textarea
    if @page.has_css?(input_elements[:message_div])
      message_area_locator = input_elements[:message_div]
    else
      message_area_locator = input_elements[:message]
    end
    @message = value
    @message_content = value

    # First click on the element to position the text area
    element = @page.find(message_area_locator)
    element.click
    element.set(@message)
  end

  alias_method :message_using_div=, :message=

  def accounts=(accounts)
    @page.find(input_elements[:accounts_dropdown]).click
    @accounts = accounts
    if accounts.is_a?(Array)
      accounts.each do |account|
        #step to get more accurate results and avoid visual bug
        #if account is not visible, the element is not clicked
        @page.find(input_elements[:accounts_dropdown_search]).set(account)
        sleep(1)
        @page.find(input_elements[:account].replace_key(account)).click
      end
    else
      #step to get more accurate results and avoid visual bug
      #if account is not visible, the element is not clicked
      @page.find(input_elements[:accounts_dropdown_search]).set(account)
      sleep(1)
      @page.find(input_elements[:account].replace_key(account)).click
    end
  end

  def done_account_select
    @page.find(input_elements[:close_accounts_dropdown]).click
  end

  def campaign_tracking=(value)
    @campaign_tracking = value
    @page.find(input_elements[:campaign_tracking]).click
    @page.find(input_elements[:campaign_tracking_dropdown]).click
    @page.find(input_elements[:campaign_tracking_name], text: "#{@campaign_tracking}").click
  end

  def preview_link
    @page.find(input_elements[:preview_link]).click
  end

  def preview_link_done
    wait_for_css(input_elements[:complete_post_preview])
    @page.find(input_elements[:complete_post_preview]).click
  end

  def preview_attached?
    @page.has_content?('will be attached to the post')
  end

  def publish
    wait_for_css(input_elements[:complete_publishing])
    @page.find(input_elements[:complete_publishing]).click
  end

  def wait_for_publish_button
    publish_button = @page.find(input_elements[:complete_publishing])
    Utils.wait_until(30, 'Timeout occurred waiting for the Publish button to be enabled') do
      publish_button['data-vh-disabled'].nil?
    end
  end

  def has_draft
    @page.has_content?('Save as Draft')
  end

  def select_shorten_choice
    sleep(5)
    @page.find(input_elements[:select_shorten_link]).click
  end

  def select_approval_chain_choice
    @page.find(input_elements[:select_approval_chain_link]).click
  end

  def pick_approval_chain(chain)
    puts "publishing modal chain name: #{chain}"
    wait_for_css(input_elements[:approval_chain_dropdown])
    @page.find(input_elements[:approval_chain_dropdown]).click
    chains_list = @page.all('.result-name')
    chains_list.each do |chain_option|
      return chain_option.click if chain_option.text.include?(chain)
    end
    @page.save_screenshot 'chain_option.png'
  end

  def do_shorten_link
    wait_for_css(input_elements[:do_shorten_link])
    @page.find(input_elements[:do_shorten_link]).click
  end

  def done_shorten_link
    @page.find(input_elements[:done_shorten_link]).click

    value = @page.find(input_elements[:message]).value
    text = @page.find(input_elements[:message]).text
    @message = text.empty? ? value : text

    @assertdata = { 'longurl' => @link }
  end

  def done_shorten_link_div
    @page.find(input_elements[:done_shorten_link]).click
    @message = @page.find(input_elements[:message_div]).text
    @message_content = @page.find(input_elements[:message_div]).text
    @assertdata = { 'longurl' => @link }
  end

  def empty_file_error
    return @page.has_content?("No messages found in the file.")
  end

  def check_format_message
    return @page.has_content?("Format and rules:") &&
      @page.has_content?("The system only accepts a .csv file (download a sample). Any other format is not supported at this moment.") &&
      @page.has_content?("Select one or more accounts to publish your messages to.") &&
      @page.has_content?("Your .csv should contain the following fields: \"Date\", \"Message\", \"URL\" (optional), \"Image URL\" (optional), and \"Delivery Confirmation\" (optional).") &&
      @page.has_content?("The accepted Date Time Format is \"YYYY-MM-DD HH:MM\". Your set time zone will be used.") &&
      @page.has_content?("Only times set in the future will be accepted.") &&
      @page.has_content?("If you want delivery confirmation, only the following values will enable it: \"yes\", \"true\", \"y\", \"t\", \"1\".") &&
      @page.has_content?("We recommend a maximum of 200 messages per file upload.") &&
      @page.has_content?("Please do not upload duplicate messages.")
  end

  def check_schedule_message(internal_tag)
    wait_for_css(input_elements[:scehdule_account_counter])
    text_to_check = @page.find(input_elements[:scehdule_account_counter]).text
    case internal_tag
    when "warning"
      return text_to_check.include?("Please select an account to schedule.")
    when "ok"
      return text_to_check.include?("Publishing to")
    end
  end

  def schedule_message_next_day
    # get current active day's value
    current_day_value = @page.find(input_elements[:schedule_active_day]).value
    current_day_text = @page.find(input_elements[:schedule_active_day]).text

    current_day = current_day_value.nil? ? current_day_text : current_day_value

    # get today's date, check if today's date is matching previous value,
    today_value = Date.today.day
    tomorrow_value = Date.today.next_day.day

    fail "Date mismatch with current day value #{current_day} and today value #{today_value}" if today_value.to_s != current_day.to_s

    # check if tomorrow's date is the first day of a month,
    @page.find(input_elements[:schedule_next_month]).click if tomorrow_value == 1 # need to got to next month

    # select date with value of next date
    @page.find(input_elements[:schedule_date], text: "#{tomorrow_value}", match: :prefer_exact).click
  end

  def start_schedule
    @page.find(input_elements[:start_schedule]).click
  end

  def schedule_message_immediately
    # currently just schedule the message by default
    # it will be published in the next 5 mins at most
    @page.find(input_elements[:done_schedule_time_selection], text: 'Done').click
  end

  def done_schedule
    @page.find(input_elements[:done_schedule], text: 'Schedule').click
  end

  def published_with_tracking?
    published? do
      link_with_campaign = @page.find(input_elements[:message_area], text: "#{@message.gsub(/https?:\/\/[\S]+/, '')}").find('p a').text
      @message = @message.gsub(/https?:\/\/[\S]+/, link_with_campaign)
      @message_content = @message
    end
  end

  def scheduled_tomorrow?
    3.times do |iter|
      yield if block_given?
      if check_message(true)
        puts '[INFO]check scheduled message tomorrow successfully!'
        return true
      else
        puts "[INFO]Retrying the #{iter + 1} time..."
      end
    end
    false
  end

  def published?
    # loop three times
    3.times do |iter|
      yield if block_given?
      if check_message
        puts '[INFO]check message successfully!'
        return true
      else
        puts "[INFO]Retrying the #{iter + 1} time..."
      end
    end
    false
  end

  #This method checks the user icon if it's assigned or not
  #@author Fernando Gallo
  def verify_pinterest_post
    return @page.has_content?(@message_content)
  end

  def verify_pinterest_post_deleted
    @page.driver.browser.navigate.refresh
    return @page.has_content?(@message_content)
  end

  def get_today_messages
    return @page.all(input_elements[:today_messages])
  end

  #@author Fernando Gallo
  def open_message_status
    wait_for_css(input_elements[:today_messages])
    messages = get_today_messages
    messages.each do |message|
      if message.text.include?(@message_content)
        return message.find(input_elements[:status_icon]).click
      end
    end
    return false
  end

  def delete_pin
    wait_for_css(input_elements[:pinterest_delete_checkbox])
    checkboxes = @page.all(input_elements[:pinterest_delete_checkbox])
    checkboxes.each do |ch|
      ch.click
    end
    @page.find(input_elements[:pinterest_delete_button]).click
    sleep 2
  end

  def back
    @page.go_back
  end

  def get_message_content
    @message_content
  end

  def get_published_message_id
    @message_id_published
  end

  def check_single_message_and_store(single_message)
    if @page.has_content?(single_message)
      message_id = get_message_id(single_message)
      @message_id_published = message_id
      puts "[INFO] message_id is : #{message_id}"
      retry_counter = 0
      begin
        retry_counter += 1
        raw_message = get_message_body(message_id)
      rescue => e
        sleep(30)
        puts e.message + '. Checking message status again after a minute ...'
        retry_counter != 15 ? retry : (return false)
      end
      enqueue_verification(raw_message, message_id) # if message["data"]["status"] == "success"
      puts '[INFO] check message and store successfully'
      true
    else
      puts '[ERROR] No message content found'
      false
    end
  end

  def check_message(tomorrow = false)
    success = true
    if @message.is_a?(Array)
      @message.each do |message|
        @page.visit(target_base_url + '/messages/day')

        # click on next if tomorrow
        @page.find(input_elements[:next_day]).click if tomorrow

        success &= check_single_message_and_store(message)
      end
    else
      @page.visit(target_base_url + '/messages/day')

      # click on next if tomorrow
      @page.find(input_elements[:next_day]).click if tomorrow
      success = check_single_message_and_store(@message)
    end
    success
  end

  def save_accounts_group(group_name)
    @page.find(input_elements[:save_as_group]).click
    @page.find(input_elements[:group_name_input]).set(group_name)
    @page.find(input_elements[:continue]).click
  end

  def select_accounts_group(_selected_group)
    @page.find(input_elements[:accounts_dropdown]).click
    @page.find(input_elements[:select_accountfilter_drop]).click
    @page.find(input_elements[:select_group_accounts]).click
    @page.find(input_elements[:select_group1]).click
    @page.find(input_elements[:close_accounts_dropdown]).click
  end

  #######################################################################
  #
  # methods working with message verification in stream
  #
  #######################################################################

  def verify_redis_messages(mins_ago)
    keys_array = $redis.keys 'publish*'
    keys_array.each do |key|
      message_object = Oj.load($redis.get(key))
      key_time = DateTime.parse(message_object['data']['created_at']).to_i # to epoch timestamp
      time_passed = Time.now.to_i - key_time
      @logger.info { "[INFO]Time passed for message #{key} is: #{time_passed}" }
      @message_key = key
      verify_message_stream(key, message_object) unless time_passed < mins_ago * 60
    end
  end

  def verify_message_stream(message_key, message_object)
    verified = true
    @logger.info { "[INFO]verifing message #{message_key} ..." }
    message_content = message_object['data']['message']['text']

    for account in message_object['data']['accounts']
      account_type = account['type']
      account_name = account['label']

      begin
        @page.visit(target_base_url + '/stream')
        # filter to specific account's stream
        @page.find(input_elements[:change_filter], text: 'Change filters').click
        @page.find(input_elements[:filter_account_type].replace_key(account_type)).click
        @page.find(input_elements[:filter_account_name].replace_key(account_name)).click
        @page.find(input_elements[:filter_preview]).click
        sleep 15
        @page.find(input_elements[:filter_preview]).click
      rescue
        raise "[ERROR]Account name #{account_name} and message content is #{message_content}"
      end

      if !@page.has_content?(message_content)
        @logger.info { "[ERROR]Message #{message_key} not found in stream page for #{account_type}" }
        @logger.info { "[ERROR]Account name #{account_name} and message content is #{message_content}" }
        verified = false
      else
        @logger.info { "[INFO]Verified message: #{message_key} on #{account_type}" }
      end
    end

    $redis.del(message_key)
    if verified
      @logger.info { "[INFO]Verified message: #{message_key} from redis and deleting ..." }
    else
      @logger.info { "[ERROR]message: #{message_key} not showed in stream ..." }
    end
  end

  #######################################################################
  #
  # methods working with draft
  #
  #######################################################################
  def save_draft
    @page.find(input_elements[:draft]).click
  end

  def drafts
    @page.visit(target_base_url + '/drafts')
    @message_id = get_message_id(@message)
  end

  def edit_drafts
    # NOTE: find the message and try to edit it, current not edit
    @page.find(input_elements[:edit_draft].replace_key(@message_id)).click
  end

  def verify_draft
    @page.visit(target_base_url + '/drafts')
    @message_id = get_message_id(@message)
  end

  def delete_draft
    @page.find(input_elements[:remove_draft_message].replace_key(@message_id)).click
    @page.find(input_elements[:footer_button], text: 'Continue').click
  end

  #######################################################################
  #
  # private instance methods
  #
  #######################################################################

  private

  def enqueue_verification(raw_message, message_id)
    @message_key = "publishing_#{message_id}"
    begin
      result = $redis.set(@message_key, raw_message)
      @logger.info "[INFO]set result: #{result}"
      result == 'OK' ? $redis.expire(@message_key, 7200) : 'Set failed' # expire keys in two hours
    rescue Exception => e
      e.inspect
      e.message
    end

    @logger.info "[INFO]enqueue_verification: #{@message_key}, status: #{result}"
  end

  def get_message_body(message_id)
    @page.visit(target_base_url + "/messages/show/#{message_id}?xhr=true")
    puts target_base_url + "/messages/show/#{message_id}?xhr=true"
    @page.document.text
  end

  def get_message_id(message)
    # find capybara node and access data-message-id
    @page.find(input_elements[:message_id], text: "#{message}")['data-message-id']
  end
end
