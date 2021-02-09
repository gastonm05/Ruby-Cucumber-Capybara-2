class MessagesPage < BasePage
  def initialize(page)
    @page = page
    go_to_messages_page
  end

  def go_to_messages_page
    puts @page.current_path
    @page.visit(target_base_url + '/messages') if @page.current_path != '/messages'
    puts @page.current_path
  end

  def select_today_messages
    wait_for_css(input_elements[:messages_today])
    @page.all(input_elements[:messages_today])
  end

  def select_messages
    wait_for_css(input_elements[:messages])
    @page.all(input_elements[:messages])
  end

  def select_message_for_review
    wait_for_css(input_elements[:messages_pending])
    @page.all(input_elements[:messages_pending])
  end

  def select_message_rejected
    wait_for_css(input_elements[:messages_rejected])
    @page.all(input_elements[:messages_rejected])
  end

  def select_message_published
    wait_for_css(input_elements[:messages_published])
    @page.all(input_elements[:messages_published])
  end

  def select_time_zone(time_zone)
    case time_zone
    when "central time"
      select_central_time_zone_dropdown
    when "pacific time"
      select_pacific_time_zone_dropdown
    when "mountain time"
      select_mountian_time_zone_dropdown
    when "eastern time"
      select_eastern_time_zone_dropdown
    end
  end

  def check_time_zone(time_zone)
    case time_zone
    when "central time"
      return check_central_time_zone_dropdown
    when "pacific time"
      return check_pacific_time_zone_dropdown
    when "mountain time"
      return check_mountain_time_zone_dropdown
    when "eastern time"
      return check_eastern_time_zone_dropdown
    else
      return false
    end
  end

  def select_central_time_zone_dropdown
    wait_for_css(input_elements[:timezone_dropdown])
    @page.find(input_elements[:timezone_dropdown]).click
    wait_for_css(input_elements[:timezone_dropdown_selections])
    @page.all(input_elements[:timezone_dropdown_selections])[0].click
  end

  def select_pacific_time_zone_dropdown
    wait_for_css(input_elements[:timezone_dropdown])
    @page.find(input_elements[:timezone_dropdown]).click
    wait_for_css(input_elements[:timezone_dropdown_selections])
    @page.all(input_elements[:timezone_dropdown_selections])[3].click
  end

  def select_mountian_time_zone_dropdown
    wait_for_css(input_elements[:timezone_dropdown])
    @page.find(input_elements[:timezone_dropdown]).click
    wait_for_css(input_elements[:timezone_dropdown_selections])
    @page.all(input_elements[:timezone_dropdown_selections])[2].click
  end

  def select_eastern_time_zone_dropdown
    wait_for_css(input_elements[:timezone_dropdown])
    @page.find(input_elements[:timezone_dropdown]).click
    wait_for_css(input_elements[:timezone_dropdown_selections])
    @page.all(input_elements[:timezone_dropdown_selections])[1].click
  end

  def select_approve_links
    wait_for_css(input_elements[:approve_message_link])
    @page.all(input_elements[:approve_message_link])
  end

  def get_week_days_list
    wait_for_css(input_elements[:week_days_list])
    days_list = []
    @page.all(input_elements[:week_days_list]).each do |day|
      days_list.push day.text
    end
    days_list
  end

  def get_messages_list
    wait_for_css(input_elements[:message_list])
    @page.all(input_elements[:message_list])
  end

  def get_messages_preview
    wait_for_css(input_elements[:paper_message_preview])
    @page.all(input_elements[:paper_message_preview])
  end

  def get_popup_entry_inline_text
    wait_for_css(input_elements[:popup_entry_line])
    @page.find(input_elements[:popup_entry_line]).text
  end

  def get_publisher_accounts_list
    wait_for_css(input_elements[:publisher_accounts_from_published_page])
    @page.all(input_elements[:publisher_accounts_from_published_page])
  end

  def get_published_message
    wait_for_css(input_elements[:published_messages])
    @page.all(input_elements[:published_messages])
  end

  def select_reject_links
    sleep(2)
    @page.all(input_elements[:reject_message_link])
  end

  def click_paper(link)
    messages = select_message_for_review
    if messages.size > 0
      messages.first.click
      case link
      when 'approve'
        click_approval_link
      when 'reject'
        click_reject_link
      when 'edit'
        click_edit_link
      end
      close_paper
      click_paper(link)
    end
  end

  def click_approval_link
    approve_links = select_approve_links
    if approve_links.size > 0
      approve_links.first.click
      sleep 2 if approve_links.size == 1
      click_approval_link
    end
  end

  def click_right_view(view)
    case view
    when "day"
      @page.find(input_elements[:day_calendar_link]).click
    when "week"
      @page.find(input_elements[:week_calendar_link]).click
    when "month"
      @page.find(input_elements[:month_calendar_link]).click
    when "archives"
      @page.click_link("Archives")
    end
  end

  def click_day_view
    @page.find(input_elements[:day_calendar_link]).click
  end

  def click_week_view
    @page.find(input_elements[:week_calendar_link]).click
  end

  def click_month_view
    @page.find(input_elements[:month_calendar_link]).click
  end

  def click_on_today_message
    wait_for_css(input_elements[:messages_today])
    @page.all(input_elements[:messages_today])[0].click
  end

  def click_on_today_message_status
    wait_for_css(input_elements[:messages_today])
    @page.all(input_elements[:messages_today])[0].find('.status').click
  end

  def click_on_upload_image
    wait_for_css('[data-original-title="Upload image"]')
    @page.find('[data-original-title="Upload image"]').click
  end

  def click_on_message_drop_down
    wait_for_css(input_elements[:message_list])
    @first_message = @page.all(input_elements[:message_list]).first
    @first_message.find('a[data-toggle=vh-dropdown]').click
    @first_message.find('a[data-toggle=vh-dropdown]').click
  end

  def click_on_view_message_detail(option)
    case option.downcase
    when 'view message details'
      select_option = :show_message
    when 'republish message'
      select_option = :republish_message
    when 'view rejections reasons'
      select_option = :rejections_reasons_option
    when 'edit tags and memo'
      select_option = :edit_tags_memo
    end
    wait_for_css(input_elements[select_option])
    @page.find(input_elements[select_option]).click
  end

  def click_message_trigger
    wait_for_css('[data-vh-id=message] .trigger')
    @page.all('[data-vh-id=message] .trigger')[0].click
    @currently_chosen_message = @page.all('[data-vh-id=message] .contents')[0]
  end

  def click_on_post_message
    wait_for_css(input_elements[:post_message_button])
    @page.find(input_elements[:post_message_button]).click
  end

  def click_on_a_message
    wait_for_css(input_elements[:message_list])
    @page.all(input_elements[:message_list])[0].click
  end

  def click_reject_link
    reject_links = select_reject_links
    if reject_links.size > 0
      reject_links.first.click
      complete_rejection_reason
    end
  end

  def click_edit_link
    @page.find(input_elements[:edit_message_link]).click
  end

  def click_delete_link
    @page.find(input_elements[:delete_message_link]).click
  end

  def close_paper
    @page.find(input_elements[:close_paper_link]).click if @page.has_css?(input_elements[:close_paper_link])
  end

  def close_page
    wait_for_css(input_elements[:close_reasons_modal])
    @page.find(input_elements[:close_reasons_modal]).click
  end

  def close_message_status
    wait_for_css(input_elements[:message_status])
    @page.find(input_elements[:message_status]).find('.btn-success').click
  end

  def approve_messages
    click_paper('approve')
  end

  def check_message_detail_opened
    wait_for_css(input_elements[:message_detail])
    @page.all(input_elements[:message_detail]).size > 0
  end

  def check_message_expanded
    @currently_chosen_message.all('a').size > 0
  end

  def check_message_collapsed
    @currently_chosen_message.all('a').size == 0
  end

  def check_message_status_opened
    wait_for_css(input_elements[:message_status])
    @page.all(input_elements[:message_status]).size > 0
  end

  def check_post_message_modal_opened
    wait_for_css(input_elements[:repost_message_modal])
    @page.all(input_elements[:repost_message_modal]).size > 0
  end

  def check_rejections_modal_opened
    wait_for_css(input_elements[:rejections_reasons_modal])
    @page.all(input_elements[:rejections_reasons_modal]).size > 0
  end

  def check_pacific_time_zone_dropdown
    ! (/pacific-time/ !~ @page.current_url)
  end

  def check_central_time_zone_dropdown
    ! (/central-time/ !~ @page.current_url)
  end

  def check_eastern_time_zone_dropdown
    ! (/eastern-time/ !~ @page.current_url)
  end

  def check_mountain_time_zone_dropdown
    ! (/mountain-time/ !~ @page.current_url)
  end

  def select_message(message_content)
    unless search_message_today((select_today_messages.size - 1), message_content, 'open')
      fail(ArgumentError.new("Can't open the message: '#{message_content}'"))
    end
  end

  ##################################
  #                                #
  # Test to speed up the execution #
  #                                #
  ##################################

  def get_locator(locator_to_search)
    case locator_to_search
    when 'edit'
      return input_elements[:edit_message_link]
    when 'delete'
      return input_elements[:delete_message_link]
    end
  end

  def edit_message_new(id)
    interact_with_message(id, 'edit')
  end

  def delete_message_new(id)
    interact_with_message(id, 'delete')
  end

  def reject_message_new(id)
    interact_with_message(id, 'reject')
  end

  def approve_message_new(id)
    interact_with_message(id, 'accept')
  end

  def scheduled_message_new(id)
    interact_with_message(id, 'schedule_check')
  end

  def on_calendar?(id)
    interact_with_message(id, 'approval_pending')
  end

  def interact_with_message(id, action)
    wait_for_css(input_elements[:entries_list])
    @page.find(input_elements[:day_calendar_link]).click
    return search_message_by_id(id, action)
  end

  def search_message_by_id(id, action)
    puts "searching for message id: #{id} with purpose: #{action}"
    wait_for_css(input_elements[:messages_today])
    i = 0
    while i<5 && (@page.first(input_elements[:paper_div])).nil?
      @page.find("div[data-message-id='#{id}']").click
      i += 1
      sleep(1)
    end
    case action
    when 'accept'
      click_accept_message
      return true
    when 'reject'
      click_reject_message
      complete_rejection_reason
      return true
    when 'edit'
      click_edit_message
      return true
    when 'delete'
      click_delete_link
      complete_message_deletion
      return true
    when 'approval_check'
      return self.is_approved?
    when 'schedule_check'
      return self.is_scheduled?
    when 'open'
      return true
    when 'approval_pending'
      return self.is_pending_for_approval?
    end
  end

  def is_pending_for_approval?
    paper = @page.find(input_elements[:paper_div])
    paper.has_css?(input_elements[:pending_question_icon_old_ui])
  end

  def complete_message_deletion
    @page.find(input_elements[:continue_button]).click
  end

  ##################################
  #                                #
  #              end               #
  #                                #
  ##################################

  def approve_message(message_content)
    wait_for_css(input_elements[:entries_list])
    unless @page.has_css?(input_elements[:messages_group])
      unless search_message_today((select_today_messages.size - 1), message_content, 'accept')
        fail(ArgumentError.new("Can't approve the message: '#{message_content}'"))
      end
    else
      @page.find(input_elements[:day_calendar_link]).click
      unless search_message_old_ui((select_messages.size - 1), message_content, 'accept')
        fail(ArgumentError.new("Can't approve the message: '#{message_content}'"))
      end
    end
    sleep(5)
    @page.has_content?('The message has been approved.')
  end

  def edit_message(message_content)
    wait_for_css(input_elements[:entries_list])
    unless @page.has_css?(input_elements[:messages_group])
      unless search_message_today((select_today_messages.size - 1), message_content, 'edit')
        fail(ArgumentError.new("Can't edit the message: '#{message_content}'"))
      end
    else
      @page.find(input_elements[:day_calendar_link]).click
      unless search_message_old_ui((select_messages.size - 1), message_content, 'edit')
        fail(ArgumentError.new("Can't edit the message: '#{message_content}'"))
      end
    end
  end

  def enter_facebook_album_name(facebook_album_name)
    @page.fill_in 'Insert an album name for Facebook ...', with: facebook_album_name
  end

  def delete_message(message_content)
    wait_for_css(input_elements[:entries_list])
    unless @page.has_css?(input_elements[:messages_group])
      unless search_message_today((select_today_messages.size - 1), message_content, 'delete')
        fail(ArgumentError.new("Can't delete the message: '#{message_content}'"))
      end
    else
      @page.find(input_elements[:day_calendar_link]).click
      unless search_message_old_ui((select_messages.size - 1), message_content, 'delete')
        fail(ArgumentError.new("Can't delete the message: '#{message_content}'"))
      end
    end
  end

  def delete_rejected_message(message_content)
    search_message(0, message_content, 'delete', 'rejected')
  end

  def click_edit_message
    wait_for_css(input_elements[:edit_message_link])
    @page.find(input_elements[:edit_message_link]).click
  end

  def reject_message(message_content)
    wait_for_css(input_elements[:entries_list])
    unless @page.has_css?(input_elements[:messages_group])
      unless search_message_today((select_today_messages.size - 1), message_content, 'reject')
        fail(ArgumentError.new("Can't reject the message: '#{message_content}'"))
      end
    else
      @page.find(input_elements[:day_calendar_link]).click
      unless search_message_old_ui((select_messages.size - 1), message_content, 'reject')
        fail(ArgumentError.new("Can't reject the message: '#{message_content}'"))
      end
    end
  end

  def search_message_today(index, message_content, criteria)
    if index >= 0
      if check_message(index, message_content)
        select_today_messages[index].click
        case criteria
        when 'accept'
          click_accept_message
          return true
        when 'reject'
          click_reject_message
          complete_rejection_reason
          return true
        when 'edit'
          click_edit_message
          return true
        when 'delete'
          click_delete_link
          return true
        when 'approval_check'
          return self.is_approved?
        when 'open'
          return true
        end
      end
      index -= 1
      return search_message_today(index, message_content, criteria)
    end
    false
  end

  def search_message_old_ui(index, message_content, criteria)
    wait_for_css(input_elements[:box_div])
    if index >= 0
      if check_message_old_ui(index, message_content)
        message_div = select_messages[index]
        case criteria
        when 'accept'
          message_div.find(input_elements[:approve_message_link]).click
          return true
        when 'reject'
          message_div.find(input_elements[:reject_message_link]).click
          complete_rejection_reason
          return true
        when 'edit'
          message_div.find(input_elements[:edit_message_link]).click
          return true
        when 'delete'
          message_div.find(input_elements[:delete_message_link]).click
          return true
        when 'approval_check'
          return self.is_approved?
        when 'open'
          return true
        end
      end
      index -= 1
      return search_message_old_ui(index, message_content, criteria)
    end
    false
  end

  def is_scheduled?
    paper = @page.find(input_elements[:paper_div])
    byebug
    return paper.has_css?(input_elements[:scheduled_clock_icon_old_ui])
  end

  def is_approved?
    paper = @page.find(input_elements[:paper_div])
    paper.has_content?('100% completed') && paper.has_css?(input_elements[:approved_message_green_icon])
  end

  def is_approver_present?(approver_name)
    paper = @page.find(input_elements[:paper_div])
    message_detail_approval = paper.find(input_elements[:message_detail_p])
    message_detail_approval.hover
    paper.has_content?(approver_name)
  end

  def click_accept_message
    wait_for_css(input_elements[:approve_message_link])
    @page.find(input_elements[:approve_message_link]).click
  end

  def click_reject_message
    wait_for_css(input_elements[:reject_message_link])
    @page.find(input_elements[:reject_message_link]).click
  end

  def search_message(index, message_content, action, search_criteria = '')
    case search_criteria
    when 'approved'
      messages = select_message_published
    when 'rejected'
      messages = select_message_rejected
    else
      messages = select_message_for_review
    end
    if index < messages.size
      messages[index].click
      index += 1
      return true if search_message_aux(0, message_content, action)
      close_paper
      return search_message(index, message_content, action, search_criteria)
    end
    false
  end

  def search_message_aux(index, message_content, action)
    messages_preview_div = get_messages_preview
    if index < messages_preview_div.size
      message_div = messages_preview_div[index]
      index += 1
      if message_div.text.include?(message_content)
        case action
        when 'approve'
          message_div.find(input_elements[:approve_message_link]).click
        when 'edit'
          message_div.find(input_elements[:edit_message_link]).click
        when 'delete'
          message_div.find(input_elements[:delete_message_link]).click
        when 'reject'
          message_div.find(input_elements[:reject_message_link]).click
          complete_rejection_reason
        end
        return true
      end
      return search_message_aux(index, message_content, action)
    end
    false
  end

  def edit_messages
    click_paper('edit')
  end

  def complete_rejection_reason
    @page.find(input_elements[:rejection_reason_textarea]).set(Faker::Lorem.sentence)
    @page.find(input_elements[:continue_button]).click
  end

  def reject_messages
    click_paper('reject')
  end

  def all_approved?
    select_message_for_review.size == 0
  end

  def approved?(message_content)
    search_message_today((select_today_messages.size - 1), message_content, 'approval_check')
  end

  def click_paper_rejected(link)
    messages = select_message_rejected
    if messages.size > 0
      messages.first.click
      case link
      when 'delete'
        click_delete_link
        @page.find(input_elements[:continue_button]).click
      when 'edit'
        return click_edit_link
      end
      close_paper
      click_paper(link)
    end
  end

  def check_for_message(message_content, message_criteria)
    messages_preview_div = get_messages_preview
    if messages_preview_div.size > 0
      messages_preview_div.each do |message_div|
        if message_div.text.include?(message_content)
          return message_div.text.include?(message_criteria)
        end
      end
    end
    false
  end

  def check_message(index, message_content, message_criteria = '')
    message_div = select_today_messages[index]
    if message_div.text.include?(message_content)
      case message_criteria
        when 'pending'
          puts "when pending"
        return message_div.has_css?(input_elements[:pending_question_icon])
      when 'scheduled'
        return message_div.has_css?(input_elements[:scheduled_clock_icon])
      else
        return true
      end
    end
  end

  def check_message_old_ui(index, message_content, message_criteria = '')
    message_div = select_messages[index]
    if message_div.text.include?(message_content)
      case message_criteria
      when 'pending'
        return message_div.has_css?(input_elements[:pending_question_icon_old_ui])
      when 'scheduled'
        return message_div.has_css?(input_elements[:scheduled_clock_icon_old_ui])
      else
        return true
      end
    end
  end

  def schedule_check(index, message_content, criteria)
    puts "index = #{index}"
    puts "message_content schedule_check =  #{message_content}"
    puts "criteria = #{criteria}"
    if index >= 0
      return true if check_message(index, message_content, criteria)
      index -= 1
      return schedule_check(index, message_content, criteria)
    end
    false
  end

  def scheduled?(message_content)
    puts "message_content de schedule =  #{message_content}"
    schedule_check((select_today_messages.size - 1), message_content, 'pending')
  end

  def scheduled_for_review?(message_content)
    schedule_check((select_today_messages.size - 1), message_content, 'scheduled')
  end

  def is_button_present?(button)
    case button
    when 'edit'
      css_to_check = input_elements[:edit_message_link]
    when 'delete'
      css_to_check = input_elements[:delete_message_link]
    end
    @page.has_css?(css_to_check)
  end

  def upload_image(image_name)
    @page.attach_file('file', "#{Rails.root}/features-2.0/Support/images/#{image_name}", visible: false)
  end

  def open_filter
    wait_for_css(input_elements[:filter])
    @page.find(input_elements[:filter]).click
    wait_for_css(input_elements[:filter_done])
  end

  def pick_source_filter(navigation_filter)
    @page.click_link(navigation_filter)
  end

  def choose_filter_option(account)
    account_name ||= YAML.load(File.open('config/source_accounts.yml'))["#{account}"]
    entries = @page.all(input_elements[:filter_entries])
    entries.each do |entry|
      return entry.click if entry["data-searchable-label"].eql?(account_name)
    end
  end

  def finish_filtering
    @page.find(input_elements[:filter_search]).click
    @page.find(input_elements[:filter_done]).click
  end

  def clear_filters
    @page.find(input_elements[:filter_clear]).click
  end

  def check_filtered_by(account)
    account_name ||= YAML.load(File.open('config/source_accounts.yml'))["#{account}"]
    wait_for_css(input_elements[:messages_grid])
    entries = @page.all(input_elements[:all_messages])
    entries.each do |entry|
      entry_accounts = entry.find(input_elements[:messages_accounts])
      return false unless entry_accounts.native['innerHTML'].include?(account_name)
    end
    return true
  end

  def check_multiple_filtered_by(account_input)
    account_list = Array.new
    account_input.split(",").each do |account_name|
      account_list << YAML.load(File.open('config/source_accounts.yml'))[account_name]
    end
    wait_for_css(input_elements[:messages_grid])
    entries = @page.all(input_elements[:all_messages])
    entries.each do |entry|
      entry_accounts = entry.find(input_elements[:messages_accounts])
      inner_code = entry_accounts.native['innerHTML']
      return false unless account_list.any? {|word| inner_code.include?(word)}
    end
    return true
  end

  def search_filter(account)
    account_name ||= YAML.load(File.open('config/source_accounts.yml'))["#{account}"]
    @page.find(input_elements[:filter_search_filed]).set(account_name)
  end

  def is_filter_present?(account)
    account_name ||= YAML.load(File.open('config/source_accounts.yml'))["#{account}"]
    entries = @page.all(input_elements[:filter_entries])
    entries.each do |entry|
      return false unless entry["data-searchable-label"].eql?(account_name)
    end
  end

  def no_entries?
    message = @page.find(input_elements[:filter_no_results_message])
    return message["data-vh-hidden"] == false
  end

  def archives_available?
    return @page.has_content?("Archive for") 
  end

  def archives_view_shown?
    wait_for_css(input_elements[:archives_date_picker])
    sleep(2)
    return @page.current_url.include?("messages/archives")
  end

  def pick_date(date_used)
    case date_used
    when "today"
      date_to_select = Time.now.strftime("%m/%d/%Y")
    when "next year"
      date_to_select = (Time.now + 31557600).strftime("%m/%d/%Y")
    end
    @page.find(input_elements[:archives_date_picker]).set("#{date_to_select}\n")
  end

  def archives_for_date(date_used)
    case date_used
    when "today"
      date_to_select = (Time.now).strftime("%B %d, %Y")
    when "next year"
      date_to_select = (Time.now + 31557600).strftime("%B %d, %Y")
    end
    return @page.has_content?("Archive for #{date_to_select}")
  end

end
