# @author Adam Kauffman
And(/^I click on facebook mentions on the change filter panel$/) do
  @s.facebook.click
end

# @author Fernando Gallo
Then /^I navigate to stream page$/ do
  @s = StreamsPage.new(page)
end

# TODO: need a better solution then this for loading the page. as you can see any entry point into the page will need a assignment
# @author Adam Kauffman
And(/^I click on streams change filter$/)do
  @s = StreamsPage.new(page)
  @s.streams_change_filter.click
end

def name_filter
  @s.filter_name.click
end

def done_btn
  @s.done_button.click
end

And(/^I click on Preview button$/) do
  @s.preview_button.click
end

def comment(comment_text)
  #wait_for_css('div[data-vh-id="message-area"]')
  @page.find('div[data-vh-id="message-area"]').click
  @page.find('div[data-vh-id="message-area"]').set(comment_text)
  #wait_for_css('a[class="btn btn-lg btn-success"]')
  @page.find('a[class="btn btn-lg btn-success"]').click
  @page.has_content?("Your message will be sent in a few moments.")
end

# @author Adam Kauffman
And(/^I click on twitter$/) do
  @s.twitter.click
end

And(/^I click on instagram$/) do
  @s.instagram.click
end

And(/^I click on Google Plus$/) do
  @s.google_plus.click
end

# @author Adam Kauffman
And(/^I click on advanced tab in the change filter panel$/) do
  @s.advanced.click
end

# @author Adam Kauffman
And(/^I click on Mentions tab in the change filter panel$/) do
  @s.mention_tab.click
end

# @author Adam Kauffman
And(/^I click on Options on the change filter panel$/) do
  @s.options.click
end

# @author Adam Kauffman
And(/^I click on Sentiment & Intent on the change filter panel$/) do
  @s.sentiment_and_intent.click
end

# @author Adam Kauffman
Then(/^I click on the streams preview button$/) do
  @s.preview.click
  # Todo remove this once timing mechanisms properly setup
  # AK need to get some pbi's in the done coloumn, so letting this in temporarily
  # typically this is a auto-decline because it artifiicially increases times for test suites to run
  sleep(7)
end

# @author Adam Kauffman
And(/^I click on twitter mentions on the change filter panel$/) do
  @s.twitter_mentions.click
end

# @author Adam Kauffman
And(/^I click on the '(.*?)' account in mentions$/) do |account|
  @s.select_mention_account(account)
end

# @author Adam Kauffman
And(/^I click on '(.*?)' from the date options in the change filter panel$/) do |timeframe|
  @s.select_date_filter(timeframe)
end

# @author Adam Kauffman
And(/^I enter a custom date range for the past ten days$/) do
  @s.date_option_custom.click
  time = Time.new
  from = (time - 10.days).strftime('%m/%d/%Y')
  to = time.strftime('%m/%d/%Y')
  @s.custom_date_from.native.send_keys(from)
  @s.custom_date_to.native.send_keys(to)
end

# @author Adam Kauffman
And(/^I mark the first stream result as '(.*?)'$/) do |sentiment|
  @s.set_result_sentiment(sentiment, 0)
end

# @author Adam Kauffman
And(/^I select the '(.*?)' twitter account$/) do |account|
  @s.select_twitter_account(account)
end

# @author Adam Kauffman
And(/^I verify all visible stream results contain the lead indicator$/) do
  @s.results_contain_element('lead')
end

# @author Adam Kauffman
And(/^I verify all visible stream results contain '(.*?)' as the source$/) do |source|
  @s.only_contains_source(source)
end

# @author Adam Kauffman
And(/^I verify the stream summary contains '(.*?)'$/) do |summary|
  found = @s.summary.text
  fail(ArgumentError.new("Expected '" + summary + "' but found '" + found + "'")) unless summary.eql?(found)
end

# @author Adam Kauffman
And(/^I verify the stream summary contains date information$/) do
  summary = 'Your smart stream includes all of your Sources at this time that have been posted between'
  found = @s.summary.text
  fail(ArgumentError.new("Expected summary to contain date info but found '" + found + "'")) unless found.include?(summary)
end

# @author Adam Kauffman
And(/^I verify the stream results are within the date range$/) do
  @s.results_within_date_range
end

# @author Adam Kauffman
And(/^I verify the stream results contain the sentiment Negative$/) do
  @s.results_contain_element('negative')
end

# @author Adam Kauffman
And(/^I verify the stream results contain the sentiment Neutral$/) do
  @s.results_contain_element('neutral')
end

# @author Adam Kauffman
And(/^I verify the stream results contain the sentiment Positive$/) do
  @s.results_contain_element('positive')
end

# @author Fernando Gallo
# AK edited 10/26 to make it clear this is dealing with tracking and stream results
Then /^I verify the tracking in the stream results$/ do
  result = @s.check_sources
  fail(ArgumentError.new('Expected true but found ' + result)) unless result
end

# @author Adam Kauffman
Then(/^I click on the options gear of Date in the change filter panel$/) do
  @s.date_options.click
end

# @author Adam Kauffman
Then(/^I activate the date filter in the change filter panel$/) do
  @s.date_filter.click
end

# @author Fernando Gallo
Then /^I click on dropdown for accounts$/ do
  @s.streams_change_filter_accounts_filter.click
end

# @author Adam Kauffman
Then(/^I click on Lead in the change filter panel$/) do
  @s.leads.click
end

# @author Adam Kauffman
Then(/^I click on Positive in the change filter panel$/) do
  @s.positive.click
end

# author Adam Kauffman
Then(/^I click on Negative in the change filter panel$/) do
  @s.negative.click
end

# @author Adam Kauffman
Then(/^I click on Neutral in the change filter panel$/) do
  @s.neutral.click
end

# @author Adam Kauffman
Then(/^I click on the close button in the change filter panel$/) do
  @s.close.click
end

Then(/^I click on Timelines on the change filter panel$/) do
  @s.timelines.click
end

# @author Fernando Gallo
Then /^I select "(.*?)" account filter dropdown option$/ do |option|
  @s.select_account_filter_option(option)
end

# TODO: need a better solution then this for loading the page. as you can see any entry point into the page will need a assignment
# @author Adam Kauffman
Then(/^I scroll the stream results into view$/) do
  @s = StreamsPage.new(page)
end

# @author Adam Kauffman
Then(/^I verify the first stream result has a '(.*?)' sentiment$/) do |sentiment|
  @s.result_contains_element(0, sentiment)
end

# @author Adam Kauffman
Then(/^I verify the preset date filter dates display '(.*?)'$/) do |timeframe|
  time = Time.new
  case timeframe.downcase
  when 'today'
    date_from = time.strftime('%m/%d/%Y')
    date_to = time.strftime('%m/%d/%Y')
  when 'yesterday'
    date_from = (time - 1.days).strftime('%m/%d/%Y')
    date_to = (time - 1.days).strftime('%m/%d/%Y')
  when 'last 7 days'
    date_from = (time - 6.days).strftime('%m/%d/%Y')
    date_to = time.strftime('%m/%d/%Y')
  when 'last 30 days'
    date_from = (time - 29.days).strftime('%m/%d/%Y')
    date_to = time.strftime('%m/%d/%Y')
  when 'custom range'
    # TODO: actual date is not stored in the control or it's attributes, need to know where it's at from dev
    fail(ArgumentError.new('Custom range is not supported at this time'))
  else
    fail(ArgumentError.new(timeframe + ' is not a valid timeframe'))
  end
  fail(('Expect dates from: ' + date_from + ' to: ' + date_to +
    ', but found from: ' + @s.date_from.text + ' to: ' + @s.date_to.text)) unless @s.is_date_range_visible(date_from, date_to) == true
end

Then /^I select a post from stream$/ do
 # @s = StreamsPage.new(page) unless @s
  @s.get_first_entry
end

Then /^I change the tags from more dropdown$/ do
  @s.click_on_change_tags
end

Then /^I add a tag as '(.*?)'$/ do |tag|
  @s.add_tags(tag)
end

Then /^I change the tag successfully$/ do
  @s.complete_tagging_task
end

Then /^I verify the tag on stream post$/ do
  result = @s.check_tag_present
  fail(ArgumentError.new("Expected true but found false")) unless result
end

Then /^I select a post with tag '(.*?)' from stream$/ do |tag|
  @s = StreamsPage.new(page) unless @s
  @s.get_first_entry_with_tag(tag)
end

Then /^I click on first post with tag '(.*?)'$/ do |tag|
  @s = StreamsPage.new(page)
  @s.click_on_first_tag(tag)
end

Then /^I see that the new window opens$/ do
  @s.change_focus_to_new_window
end

Then /^I see posts only with tag '(.*?)'$/ do |tag|
  @s.check_tag_present_all_posts(tag)
end

Then /^I add '(.*?)' tags$/ do |tag_group_name|
  @s.add_multiple_tags(tag_group_name)
end

Then /^I change the tags successfully$/ do
  @s.complete_tagging_task
end

Then /^I verify multiple tags on stream post$/ do
  result = @s.check_multiple_tag_present
  fail(ArgumentError.new("Expected true but found false")) unless result
end

Then /^I select a post with tag from stream$/ do
  @s = StreamsPage.new(page) unless @s
  @s.get_first_entry_with_tag
end

Then /^I delete all the tags from the selected post$/ do
  @s.remove_previous_tags
  @s.complete_tagging_task
end

Then /^I see the tags are deleted from the selected post$/ do
  result = @s.check_no_tags_on_selected_post
  fail(ArgumentError.new("There are still some tags on the post")) unless result
end

Then /^I see that the tag is deleted successfully from posts$/ do
  result = @s.check_no_tags_on_post
  fail(ArgumentError.new("Expected true but found false")) unless result
end

Then /^I enter text '(.*?)'$/ do |value|
  @s.fill_tag_input_with(value)
end

Then /^I see the values in dropdown$/ do
  result = @s.is_dropdown_present?
  fail(ArgumentError.new("The dropdown is not present!")) unless result
end

Then /^I select a value from dropdwon$/ do
  @s.pick_value_from_tag_dropdown
end

Then /^I select '(.*?)' tags$/ do |tag|
  @s.set_tag_for_search(tag)
end

Then /^I enable the tag field$/ do
  @s.enable_tags
end

Then /^I verify the stream results contain only relevant posts with specified tag '(.*?)'$/ do |tag|
  result = @s.check_streams_if_tag_present(tag)
  fail(ArgumentError.new("There are Stream post without the tag searched")) unless result
end

Then /^I click on 'assign to\.\.\.' from more dropdown$/ do
  @s.click_on_assign_to
end

Then /^I verify the stream results contain only relevant posts with '(.*?)' tags$/ do |tag_set_name|
  result = @s.check_streams_if_tag_present(tag_set_name)
  fail(ArgumentError.new("There are Stream post without the tag searched")) unless result
end

Then /^I verify the stream summary contains '(.*?)' tag set$/ do |tag_set_name|
  result = @s.check_if_tag_set_present(tag_set_name)
  fail(ArgumentError.new("There are Tags missing on the Summary")) unless result
end

Then /^I navigate to stream to verify the tag deleted from the post$/ do
  result = !@s.check_tag_present
  fail(ArgumentError.new("Expected False but found True")) unless result
end

Then(/^I click on edit for tags on the first post$/) do
  @s.edit_tags_first
end


Then(/^I verify the tag '(.*?)' on the last post$/) do |tag_to_search|
  @s.check_first_entry(tag_to_search)
end

Then(/^I verify the tag '(.*?)' is not present on the posts$/) do |tag_to_search|
  @s.check_first_entry_not_present(tag_to_search)
end

Then(/^I click on edit for the first tag$/) do
  @s.edit_tag
end
Then /^I see the task assigned status in user icon$/ do
  result = @s.verify_notification
  fail(ArgumentError.new("The notifications are empty")) unless result
end

Then /^I hover the mouse over user icon$/ do
  @s.hover("user_icon")
end

Then /^I verify the assigner for the task in tooltip$/ do
  result = @s.verify_tooltip("Assigned to")
  fail(ArgumentError.new("The text searched is not the showed one")) unless result
end

Then /^I click on the user icon$/ do
  @s.click_user_icon
end

Then /^I see the assign to field set to '(.*?)'$/ do |user|
  @s.check_user_to_assign(user)
end

Then /^I remove the user '(.*?)' from assign to field$/ do |user|
  @s.remove_user_from_assign_to_field(user)
end

Then /^I see the text '(.*?)' in tooltip$/ do |text|
  result = @s.verify_tooltip(text)
  fail(ArgumentError.new("The text searched is not the showed one")) unless result
end

Then /^I navigate back to the stream$/ do
  visit ('/stream')
end

Then /^I fetch the post for modified task$/ do
  @s.get_used_entry
end

Then /^I add the assign to field with user '(.*?)'$/ do |user|
  @s.add_user(user)
end

Then /^I click on '(.*?)'$/ do |option|
  @s.pick_filter_source(option)
end

Then /^I select the '(.*?)' pinterest account$/ do |opt|
  @s.select_account_filter_source(opt)
  @s.click_on_preview
end

Then /^I verify last pin from the '(.*?)' pinterest account on stream$/ do |account|
  @s.check_last_pin_from_account(account)
end

And(/^I save the filter preferences$/) do
  @s ||= StreamsPage.new(page)
  @s.save_button_filter.click
end

And(/^I name the filter as '(.*?)'$$/) do |filter_name|
  @s.name_filter(filter_name)
end

And(/^I click on done button$/) do
  @s.done_btn
end

And(/^I select account '(.*?)' from stream$/) do |account|
  #@s ||= StreamsPage.new(page)
  @s.select_account(account)
end

When(/^I navigate to stream$/) do
  @s ||= StreamsPage.new(page)
end

And(/^I select to comment the first post of stream$/) do
  @s.comment_first_post
end

When /^I comment the stream post with '(.*?)'$/ do |comment_text|
  @s.comment_post(comment_text)
end


And(/^I delete the comment '(.*?)' from stream$/) do |comment_to_delete|
    @s.delete_comment(comment_to_delete)
end

And(/^I verify there is no more comment containing "([^"]*)" from stream$/) do |comment_to_verify|
  @s.verify_comment_remove(comment_to_verify)
end

And(/^I edit the comment '(.*?)' from stream with the new content '(.*?)'$/) do |comment_to_edit, new_content|
  @s.edit_comment(comment_to_edit, new_content)
end

Then /^I verify the facebook message is on stream with '(.*?)' mention$/ do |account|
  @s.check_last_message_from_facebook(account)
end

Then /^I click on edit for tags on the selected post$/ do
  @s.edit_tags_for_selected_post
end