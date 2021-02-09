class StreamsPage < BasePage
  def initialize(page)
    @page = page
  end

  #--------------------- Web Elements ---------------------
  def instagram() @page.find(input_elements[:twitter]) end
  def advanced() @page.find(input_elements[:advanced]) end
  def change_tags() @page.find(input_elements[:change_tags]) end
  def close() @page.find(input_elements[:close_change_filter]) end
  def custom_date_from() @page.find(input_elements[:date_custom_from]) end
  def custom_date_to() @page.find(input_elements[:date_custom_to]) end
  def date_filter() @page.find(input_elements[:date_filter]) end
  def date_from() @page.find(input_elements[:date_from]) end
  def date_options() @page.find(input_elements[:date_options]) end
  def date_option_custom() @page.find(input_elements[:date_option_custom]) end
  def date_option_last_seven() @page.find(input_elements[:date_option_last_seven]) end
  def date_option_last_thirty() @page.find(input_elements[:date_option_last_thirty]) end
  def date_option_today() @page.find(input_elements[:date_option_today]) end
  def date_option_yesterday() @page.find(input_elements[:date_option_yesterday]) end
  def date_to() @page.find(input_elements[:date_to]) end
  def facebook() @page.find(input_elements[:facebook]) end
  def leads() @page.find(input_elements[:leads]) end #refers to the filter option
  def mark_negative() @page.find(input_elements[:mark_negative]) end
  def mark_neutral() @page.find(input_elements[:mark_neutral]) end
  def mark_positive() @page.find(input_elements[:mark_positive]) end
  def mention_tab() @page.find(input_elements[:change_filter_mention]) end
  def negative() @page.find(input_elements[:negative]) end #refers to the filter option
  def neutral() @page.find(input_elements[:neutral]) end #refers to the filter option
  def options() @page.find(input_elements[:options]) end
  def pinterest() @page.find(input_elements[:pinterest]) end
  def positive() @page.find(input_elements[:positive]) end #refers to the filter option
  def preview() @page.find(input_elements[:preview]) end
  def result_lead() @page.find(input_elements[:result_lead]) end #refers to the lead tag in a result
  def result_negative() @page.find(input_elements[:result_negative]) end #refers to the negative tag in a result
  def result_neutral() @page.find(input_elements[:result_neutral]) end #refers to the netural tag in a result
  def sentiment_and_intent() @page.find(input_elements[:sentiment_and_intent]) end
  def streams_change_filter() @page.find(input_elements[:change_filter]) end
  def streams_change_filter_accounts_filter() @page.find(input_elements[:accounts_filter]) end
  def summary() @page.find(input_elements[:summary]) end
  def summary_from() @page.find(input_elements[:summary_from]) end
  def summary_to() @page.find(input_elements[:summary_to]) end
  def timelines() @page.find(input_elements[:timelines]) end
  def twitter() @page.find(input_elements[:twitter]) end
  def twitter_mentions() @page.find(input_elements[:twitter_mentions]) end

  def date_option_today
    @page.find(input_elements[:date_option_today])
  end

  def date_option_yesterday
    @page.find(input_elements[:date_option_yesterday])
  end

  def date_to
    @page.find(input_elements[:date_to])
  end

  def facebook
    @page.find(input_elements[:facebook])
  end

  # refers to the filter option
  def leads
    @page.find(input_elements[:leads])
  end

  def mark_negative
    @page.find(input_elements[:mark_negative])
  end

  def mark_neutral
    @page.find(input_elements[:mark_neutral])
  end

  def mark_positive
    @page.find(input_elements[:mark_positive])
  end

  def mention_tab
    @page.find(input_elements[:change_filter_mention])
  end

  # refers to the filter option
  def negative
    @page.find(input_elements[:negative])
  end

  # refers to the filter option
  def neutral
    @page.find(input_elements[:neutral])
  end

  def options
    @page.find(input_elements[:options])
  end

  # refers to the filter option
  def positive
    @page.find(input_elements[:positive])
  end

  def preview_button
    @page.find(input_elements[:preview])
  end

  # refers to the lead tag in a result
  def result_lead
    @page.find(input_elements[:result_lead])
  end

  # refers to the negative tag in a result
  def result_negative
    @page.find(input_elements[:result_negative])
  end

  # refers to the netural tag in a result
  def result_neutral
    @page.find(input_elements[:result_neutral])
  end

  def sentiment_and_intent
    @page.find(input_elements[:sentiment_and_intent])
  end

  def streams_change_filter
    @page.find(input_elements[:change_filter])
  end

  def streams_change_filter_accounts_filter
    @page.find(input_elements[:accounts_filter])
  end

  def summary
    @page.find(input_elements[:summary])
  end

  def summary_from
    @page.find(input_elements[:summary_from])
  end

  def summary_to
    @page.find(input_elements[:summary_to])
  end

  def timelines
    @page.find(input_elements[:timelines])
  end

  def twitter
    @page.find(input_elements[:twitter])
  end

  def comment_post(comment_text)
    #wait_for_css('div[data-vh-id="message-area"]')
    @page.find('div[data-vh-id="message-area"]').click
    @page.find('div[data-vh-id="message-area"]').set(comment_text)
    #wait_for_css('a[class="btn btn-lg btn-success"]')
    @page.find('a[class="btn btn-lg btn-success"]').click
    @page.has_content?("Your message will be sent in a few moments.")
  end

  def delete_comment(comment_to_delete)
    wait_for_css('a[data-action-handler="reply"]')
    comment_links = get_comments_links
    comment_links[0..5].each do |comment_link|
      puts 'Checking comment/s of Post'
      comment_link.click
      comments_content = get_comments_content
      comments_content.each do |comment_content|
        if comment_content.text.include?(comment_to_delete)
          @page.within(comment_content) do
            @page.find('a[data-action-handler="remove-comment"]').click
          end
          confirm_remove
          puts "1 comment deleted"
        else puts"The content of the comment checked does not match the : #{comment_to_delete}"
        end
      end
    end
    puts "All comments were checked"
  end

  def edit_comment(comment_to_edit, new_content)
    wait_for_css('a[data-action-handler="reply"]')
    comment_links = get_comments_links
    comment_links[0..5].each do |comment_link|
      puts 'Checking comment/s of Post'
      comment_link.click
      comments_content = get_comments_content
      comments_content.each do |comment_content|
        if comment_content.text.include?(comment_to_edit)
          @page.within(comment_content) do
            @page.find('a[data-action-handler="edit-comment"]').click
            @page.find('div[data-vh-id="message-area"]').click
            @page.find('div[data-vh-id="message-area"]').set(new_content)
            @page.find('a[data-action="save"]').click
          end
          puts "1 comment edited"
        else puts"The content of the comment checked does not match the : #{comment_to_edit}"
        end
      end
    end
    puts "All comments were checked"
  end

  def verify_comment_remove(comment_to_verify)
    wait_for_css('a[data-action-handler="reply"]')
    comment_links = get_comments_links
    comment_links[0..10].each do |comment_link|
      puts 'Checking comment/s of Post'
      comment_link.click
      comments_content = get_comments_content
      comments_content.each do |comment_content|
        if comment_content.text.include?(comment_to_verify) do
          fail(ArgumentError.new("Verification Failed: 1 Comment found matching the argument: #{comment_to_verify}"))
        end
        end
      end
    end
    puts "Verification Completed"
  end

  def confirm_remove
    @page.find('a[class="btn btn-lg btn-danger"]').click
    @page.has_content?("Your comment has been deleted.")
  end

  def get_comments_links
    @page.all('a[data-action-handler="toggle-comments"]')
  end

  def get_comments_content
    @page.all('div[data-post-hierachy="comment"]')
  end

  def instagram
    @page.find(input_elements[:instagram])
  end

  def google_plus
    @page.find(input_elements[:google_plus])
  end

  def save_button_filter
    @page.find(input_elements[:save_button_filter])
  end

  def filter_name
    @page.find(input_elements[:filter_name])
  end

  def done_button
    @page.find(input_elements[:done_button])
  end

  def preview_button
    @page.find(input_elements[:preview])
  end

  def twitter_mentions
    @page.find(input_elements[:twitter_mentions])
  end

  def select_account(account)
    @page.first('li[data-searchable-label=' + '"' + account + '"' + ']').click
  end

  def comment_first_post
    wait_for_css('a[data-action-handler="reply"]')
    @page.first('a[data-action-handler="reply"]').click
  end

  #------------------ Convenience Methods ------------------
  # This method returns the entries currently loaded in the dom. This should be used with secondary finds
  # @return an array of WebElements containing each result "container"
  # @author Adam Kauffman
  def get_entries
    @page.all(input_elements[:entries])
  end

  def get_tags
    @page.all(input_elements[:tag])
  end

  def click_on_preview
    return self.preview.click
  end

  def check_last_pin_from_account(account)
    sleep 10
    entries = get_entries
    entries.each do |entry|
      return entry.find(input_elements[:entry_time_link]).text.include?("ago")
    end
    return false
  end

  def check_last_message_from_facebook(account)
    entries = get_entries
    entries.each do |entry|
      return true if entry.find(input_elements[:entry_content_body]).text.include?(account)
    end
    return false
  end

  # This method returns the sources for the current results
  # @return an array of WebElements containing the values for source
  # @author Adam Kauffman
  def set_tag_for_search(tag)
    @page.all(input_elements[:entries])
    @page.find(input_elements[:tag_filter_field]).set(tag)
    @page.find(input_elements[:tag_selected]).click
    @used_tag = tag
  end

  def check_streams_if_tag_present(tag_set_name)
    if @page.has_content?("No entries found.")
      return true
    else
      entries = get_entries
      entries.each do |entry|
        return false unless entry.text.include?(tag_set_name)
      end
      return true
    end
  end

  def check_stream_with_tag_set(tag_set)
    if @page.has_content?("No entries found.")
      return true
    else
      @tag_group_data ||= YAML::load(File.open("config/stream_engage.yml"))["#{tag_set}"]
      entries = get_entries
      entries.each do |entry|
        @tag_group_data.each do |tag|
          return false unless entry.text.include?(tag)
        end
      end
      return true
    end
  end

  #This method set and returns the first entry currently loaded in the dom. This should be used with secondary finds
  #@return a WebElement containing first post over the stream list
  #@author Fernando Gallo
  def get_first_entry
    wait_for_css(input_elements[:entries_list])
    entries = get_entries
    entries.each do |entry|
      unless entry.has_css?(input_elements[:tag_link_on_stream])
        @stream_post = entry
        @stream_post_id = @stream_post["data-mention-id"]
        return true
      end
    end
    #fail(ArgumentError.new("All stream posts have tags"))
  end

  def delete_all_tags
    wait_for_css(input_elements[:delete_tag_link])
    tags = @page.all(input_elements[:delete_tag_link])
    puts "tags founded: #{tags.size}"
    tags.each do |tag|
      puts "deleting #{tag.text}"
      tag.click
    end
  end

  def get_first_entry_with_tag(tag = nil)
    wait_for_css(input_elements[:entries_list])
    streams = get_entries
    streams.each do |stream|
      tags_on_stream = stream.all(input_elements[:tag_link_on_stream])
      if tag.nil? && tags_on_stream.size > 0
        @stream_post = stream
        @stream_post_id = @stream_post["data-mention-id"]
        return @stream_post
      else
        tags_on_stream.each do |tag_on_stream|
          if tag_on_stream.text.include?(tag)
            @stream_post = stream
            @stream_post_id = @stream_post["data-mention-id"]
            return @stream_post
          end
        end
      end
    end
    fail(ArgumentError.new("Tag #{tag} not found on the stream posts"))
  end

  def click_on_tag(tag)
    tags_on_stream = @stream_post.all(input_elements[:tag_link_on_stream])
    tags_on_stream.each do |tag_on_stream|
      return tag_on_stream.click if tag_on_stream.text.include?(tag)
    end
    fail(ArgumentError.new("Tag #{tag} not found on the stream post selected"))
  end

  def click_on_first_tag(tag)
    wait_for_css(input_elements[:entries_list])
    @page.first(input_elements[:tag_to_verify]+tag+ '"' + ']').click
  end

  def click_on_first_tag2(tag)
   @page.first(input_elements(:tag),:with =>(tag)).click
    tags_on_stream = @stream_post.all(input_elements[:tag_link_on_stream])
    tags_on_stream.each do |tag_on_stream|
      return tag_on_stream.click if tag_on_stream.text.include?(tag)
    end
    fail(ArgumentError.new("Tag #{tag} not found on the stream post selected"))
  end

  def change_focus_to_new_window
    @main_page = @page.driver.browser.window_handles.first
    @popup_window = @page.driver.browser.window_handles.last
    @page.driver.browser.switch_to.window(@popup_window)
  end

  def check_tag_present_all_posts(tag)
    streams = get_entries
    streams.each do |stream|
      tags_on_stream = stream.all(input_elements[:tag_link_on_stream])
      fail(ArgumentError.new("Tag #{tag} not found on the stream posts")) unless check_for_tag_helper(tag, tags_on_stream)
    end
    end

  def check_for_tag_helper(tag_to_search, tags_on_stream)
    tags_on_stream.each do |tag_on_stream|
      return true if tag_on_stream.text.include?(tag_to_search)
    end
    return false
  end

  def check_if_tag_set_present(tag_set)
    summary_text = summary.text
    @tag_group_data ||= YAML::load(File.open("config/stream_engage.yml"))["#{tag_set}"]
    @tag_group_data.each do |tag|
      return false unless summary_text.include?(tag)
    end
    return true
  end

  def remove_previous_tags
    wait_for_css(input_elements[:tag_input_field])
    tags = @page.all(input_elements[:delete_tag_link])
    tags.each do |tag|
      tag.click
    end
  end

  def add_multiple_tags(tag_group_name)
    #remove_previous_tags
    @tag_group_data ||= YAML::load(File.open("config/stream_engage.yml"))["#{tag_group_name}"]
    @tag_group_data.each_with_index do |tag, index|
      if index == 0
        locator = input_elements[:tag_input_field]
      else
        locator = input_elements[:tag_input_field_with_content]
      end
        @page.find(locator).set(tag)
        @page.find(input_elements[:tag_selected]).click
    end
  end

  #This method clicks on the 'more' link located on the stream post and then on the 'change_tags' option
  #@author Fernando Gallo
  def click_on_change_tags
    @stream_post.find(input_elements[:result_more]).click
    wait_for_css(input_elements[:change_tags])
    @page.find(input_elements[:change_tags]).click
  end

  #This method clicks on the 'more' link located on the streap post and then on the 'change_tags' option
  #@author Fernando Gallo
  def click_on_assign_to
    @stream_post.find(input_elements[:result_more]).click
    @stream_post.find(input_elements[:result_more]).click unless @page.has_css?(input_elements[:assign_to])
    wait_for_css(input_elements[:assign_to])
    @page.find(input_elements[:assign_to]).click
    #@stream_post.find(input_elements[:assign_to]).click
  end

  #This method checks the user icon if it's assigned or not
  #@author Fernando Gallo
  def verify_notification
    wait_for_css(input_elements[:entries])
    entries = get_entries
    entries.each do |entry|
      if entry["data-mention-id"].eql?(@stream_post_id)
        user_icon = entry.all(input_elements[:notification_icon]).first
        return true if user_icon["data-original-title"].include?("Assigned to ")
        return false
      end
    end
    return false
  end

  def check_user_to_assign(user)
    return @page.has_content?(user)
  end

  def remove_user_from_assign_to_field(user)
    search_choices = @page.all(input_elements[:tag_items])
    search_choices.each do |choice|
      choice.find(input_elements[:delete_tag_link]).click if choice.text.include?(user)
    end
  end

  #This method clicks the user icon
  #@author Fernando Gallo
  def click_user_icon
    wait_for_css(input_elements[:entries])
    entries = get_entries
    entries.each do |entry|
      if entry["data-mention-id"].eql?(@stream_post_id)
        return entry.all(input_elements[:notification_icon]).first.click
      end
    end
    return false
  end

  def get_used_entry
    wait_for_css(input_elements[:entries])
    entries = get_entries
    entries.each do |entry|
      if entry["data-mention-id"].eql?(@stream_post_id)
        return entry
      end
    end
    return false
  end

  #This method checks the user icon if it's assigned or not
  #@author Fernando Gallo
  def verify_tooltip(text)
    return @page.has_content?(text)
  end

  def pick_filter_source(option)
    return pinterest.click
  end

  #This method set the desired tag to the tags input field
  #@param the tag desired to be added
  #@author Fernando Gallo
  def add_tags(tag)
    remove_previous_tags
    if @page.find(input_elements[:tag_input_field]).present?
           @page.find(input_elements[:tag_input_field]).set(tag)
      else
      @page.find(input_elements[:tag_input_field2]).set(tag)
    end
    @page.find(input_elements[:tag_selected]).click
    @used_tag = tag
  end

  def fill_tag_input_with(value)
    wait_for_css(input_elements[:tag_input_field])
    @page.find(input_elements[:tag_input_field]).set(value)
  end

  def is_dropdown_present?
    @page.has_css?(input_elements[:tag_selected])
  end

  def pick_value_from_tag_dropdown
    @page.find(input_elements[:tag_selected]).click
  end

  def enable_tags
    if @page.find('li[class="entry tall selected"]').present?
    @page.find(input_elements[:tag_filter_option]).click
      puts " Enabling Tag search"
    else
      puts " Tag search is enabled"
    end
  end

  #This method clicks on the 'change tags' button to complete the tagging task
  #@author Fernando Gallo
  def complete_tagging_task
    wait_for_css(input_elements[:change_tags_button])
    @page.find(input_elements[:change_tags_button]).click
   # wait_until_css_is_gone(input_elements[:tag_input_field])
  end

  #This method verify if tag is currently added to the stream post
  #@return true if the tag text is included into the stream post
  #@author Fernando Gallo
  def check_tag_present
    entries = get_entries
    entries.each do |entry|
      if entry["data-mention-id"].eql?(@stream_post_id)
        tags = entry.all(input_elements[:tag_link_on_stream])
        tags.each do |tag_on_stream|
          return true if tag_on_stream.text.include?(@used_tag)
        end
        return false
      end
    end
    return false
  end

  def get_my_post
    wait_for_css(input_elements[:entries_list])
    entries = get_entries
    entries.each do |entry|
      if entry["data-mention-id"].eql?(@stream_post_id)
        @stream_post = entry
        return true
      end
    end
    fail(ArgumentError.new("Stream post not found!"))
  end

  def check_no_tags_on_selected_post
    sleep(5)
    wait_for_css(input_elements[:entries_list])
    entries = get_entries
    entries.each do |entry|
      if entry["data-mention-id"].eql?(@stream_post_id)
        tags = entry.all(input_elements[:tag_link_on_stream])
        return tags.size < 1
      end
    end
    fail(ArgumentError.new("Stream post not found!"))
  end

  def check_no_tags_on_post(tag = nil)
    if tag
      return !@stream_post.has_content?(tag)
    else
      return @stream_post.all(input_elements[:tag_link_on_stream]).nil?
    end
  end

  def check_multiple_tag_present
    @tag_group_data.each do |tag|
      return false unless @page.has_content?(tag)
    end
    return true
  end

  def edit_tags_first
    wait_for_css(input_elements[:edit_tag])
    @page.first(input_elements[:edit_tag]).click
  end

  def edit_tags_for_selected_post
    streams = get_entries
    streams.each do |stream|
      if stream["data-mention-id"].eql?(@stream_post_id)
        return @stream_post.find(input_elements[:edit_tag]).click
      end
    end
  end

  def hover(element_to_hover)
    wait_for_css(input_elements[:entries])
    entries = get_entries
    entries.each do |entry|
      if entry["data-mention-id"].eql?(@stream_post_id)
        case element_to_hover
        when "user_icon"
          user_icon = entry.all(input_elements[:notification_icon]).first
          user_icon.hover
          return true
        end
        return false
      end
    end
    return false
  end

  def check_first_entry_not_present(tag_to_search)
    tags = get_tags
    tags.each do |tag|
      return false if tag.text.include?(tag_to_search)
    end
    return true
    end

  def check_first_entry(tag_to_search)
    tags = get_tags
    tags.each do |tag|
        return false unless tag.text.include?(tag_to_search)
    end
  end

  def edit_tag
    tags =    @page.all(input_elements[:edit_tag])
    tags.each do |tag|


    end
  end

  def check_tag
    entries = get_entries
    entries.each do |entry|
          return false unless entry.text.include?(@used_tag)
        end
        return false
  end


  #This method returns the sources for the current results
  #@return an array of WebElements containing the values for source
  #@author Adam Kauffman
  def get_sources
    @page.all(input_elements[:sources_list])
  end

  # This method determines if the supplied dates are visible in the options panel
  # @param [string] from_date - the from date
  # @param [string] to_date - the to date
  # @return [boolean]
  # @author Adam Kauffman
  def is_date_range_visible(from_date, to_date)
    found = false
    if (date_from.text.include? from_date) && (date_to.text.include? to_date)
      found = true
    end
    found
  end

  # this method determines if the visible results contain the supplied value
  # if it is not found or there are no results the test will fail.
  # @param [string] value - the name of the source to check for
  # @author Adam Kauffman
  def only_contains_source(value)
    eles = get_sources

    if eles.nil? || eles.length == 0
      fail(ArgumentError.new('no results were found'))
    else
      eles.each do |source|
        unless source.text.include? value
          fail(ArgumentError.new("Expected source to contain '" + value + "' but found '" + source.text + "'"))
        end
      end
    end
  end

  # This method will look at each result in the dom and verify the supplied element exists
  # If the supplied field is not found or the results are empty this method will fail the test
  # @param [string] field - a field in the results. Values are: "lead"
  # @author Adam Kauffman
  def results_contain_element(field)
    eles = get_entries

    if eles.nil? || eles.length == 0
      fail(ArgumentError.new('no results were found'))
    else
      # elements exist, get the correct locator
      case field.downcase
      when 'lead'
        @loc = input_elements[:result_lead]
      when 'negative'
        @loc = input_elements[:result_negative]
      when 'neutral'
        @loc = input_elements[:result_neutral]
      when 'positive'
        @loc = input_elements[:result_positive]
      else fail(ArgumentError.new(field + ' is not a valid field'))
      end
      eles.each do |result|
        unless result.has_css? @loc
          fail(ArgumentError.new('Not all visible records contained the field ' + field))
        end
      end
    end
  end

  # This method will look at each result in the dom and verify the supplied element exists
  # If the supplied field is not found or the results are empty this method will fail the test
  # @param [string] field - a field in the results. Values are: "lead", "negative", "neutral", "positive"
  # @author Adam Kauffman
  def result_contains_element(index, field)
    eles = get_entries

    if eles.nil? || eles.length == 0
      fail(ArgumentError.new('no results were found'))
    else
      # elements exist, get the correct locator
      case field.downcase
      when 'lead'
        @loc = input_elements[:result_lead]
      when 'negative'
        @loc = input_elements[:result_negative]
      when 'neutral'
        @loc = input_elements[:result_neutral]
      when 'positive'
        @loc = input_elements[:result_positive]
      else fail(ArgumentError.new(field + ' is not a valid field'))
      end
      results = get_entries
      result = results[index]
      unless result.has_css? @loc
        fail(ArgumentError.new('record does not contain the field ' + field))
      end
    end
  end

  # this method will determine if the visible results are within the date range in the filter summary message
  # @author Adam Kauffman
  def results_within_date_range
    eles = get_entries

    from = Date.strptime(summary_from.text, '%m/%d/%Y').strftime('%m/%d/%Y')
    to = Date.strptime(summary_to.text, '%m/%d/%Y').strftime('%m/%d/%Y')

    range = (from..to)
    if eles.nil? || eles.length == 0
      fail(ArgumentError.new('no results were found'))
    else
      eles.each do |result|
        the_date = Date.parse(result.find(input_elements[:result_date])['data-absolute-date']).strftime('%m/%d/%Y')
        unless range.include? the_date
          fail(ArgumentError.new(the_date.to_s + ' was not between ' + from.to_s + ' and ' + to.to_s))
        end
      end
    end
  end

  # this method will click on custom date filter and apply the supplied dates, for preset date ranges use select_date_filter
  # @param [string] from_date
  # @param [string] to_date
  # @author Adam Kauffman
  def select_custom_date_filter(from_date, to_date)
    date_option_custom.click
    custom_date_from.text = from_date
    custom_date_to.text = to_date
  end

  # this method will click on the supplied preset time frame. for custom date range use select_custom_date_filter
  # @param [string] timeframe - the preset time frame
  # @author Adam Kauffman
  def select_date_filter(timeframe)
    case timeframe.downcase
    when 'today'
      date_option_today.click
    when 'yesterday'
      date_option_yesterday.click
    when 'last 7 days'
      date_option_last_seven.click
    when 'last 30 days'
      date_option_last_thirty.click
    else
      fail(ArgumentError.new(timeframe + ' was not found. use select_custom_date_filter for custom dates'))
    end
  end

  # this method will click on the first account name found with the param in the list of twitter account
  # @param [string] account_name - the name of the account to click on
  # @author Adam Kauffman
  def select_twitter_account(account_name)
    account = input_elements[:twitter_account_start] + account_name + input_elements[:twitter_account_end]
    @page.find(account).click
  end

  # this method will click on the first account name found with the param in the list of mention accounts
  # @param [string] account_name - the name of the account to click on
  # @author Adam Kauffman
  def select_mention_account(account_name)
    account = input_elements[:mentions_account_start] + account_name + input_elements[:mentions_account_end]
    @page.find(account).click
  end

  # this method will click on the first option found with the param in the list of options for account filter
  # @param [string] Filter - the name of the account to click on
  # @author Fernando Gallo
  def select_account_filter_option(option)
    options = @page.all(input_elements[:filter_options])
    options.each do |op|
      return op.click if op.text.eql?(option)
    end
    fail(ArgumentError.new("Unable to click on option: #{option}"))
  end

  # this method will click on the first option found with the param in the list of options for account filter
  # @param [string] Filter - the name of the account to click on
  # @author Fernando Gallo
  def select_account_filter_source(opt)
    elements = @page.all(input_elements[:entry_sources_list])
    puts opt
    elements.each do |elem|
      puts elem.text
      return elem.click if elem.text.include?(opt)
    end
    fail(ArgumentError.new("Unable to click on option: #{opt}"))
  end

  # this method will set results at the supplied indices to the supplied sentiment
  # @param [string] sentiment - a sentiment to set all of the indices to
  # @param [string] index - one based index of the result to set the sentiment of
  # @author Adam Kauffman
  def set_result_sentiment(sentiment, index)
    results = get_entries
    result = results[index]
    result.find(input_elements[:result_more]).click

    case sentiment.downcase
    when 'positive'
      sentiment_ele = mark_positive
    when 'negative'
      sentiment_ele = mark_negative
    when 'neutral'
      sentiment_ele = mark_neutral
    else fail(sentiment + ' is not a valid sentiment')
    end
    sentiment_ele.click
  end

  def tag_first_entry
    wait_for_css(input_elements[:entries_list])
    entries = get_entries
    entries.first do |entry|
      unless entry.has_css?(input_elements[:tag_link_on_stream])
        @stream_post = entry
        @stream_post_id = @stream_post["data-mention-id"]
        return true
      end
    end
    fail(ArgumentError.new("All stream posts have tags"))
  end
  # this method will ask which filter we use and verify data is displayed properly
  # @Author Fernando Gallo
  def check_sources
    if @page.has_content?('No entries found.')
      return true
    else
      sources_type = @page.find(input_elements[:filter_content]).text
      elements = @page.all(input_elements[:entry_sources_list])
      case sources_type
      when 'Tracked'
        return !@page.has_css?(input_elements[:untracked_entry_marker])
      when 'Invalid'
        elements.each do |elem|
          return false unless elem.has_css?(input_elements[:invalid_entry_marker])
        end
        return true
      when 'Untracked'
        elements.each do |elem|
          return false unless elem.has_css?(input_elements[:untracked_entry_marker])
        end
        return true
      when 'Valid'
        return !@page.has_css?(input_elements[:invalid_entry_marker])
      when 'All'
        return elements.size > 0
      end
      return false
    end
  end
end
