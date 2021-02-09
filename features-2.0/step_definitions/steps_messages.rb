When(/^I see the days of the calendar$/) do
  @message_page ||= MessagesPage.new(page)
  @message_page.click_month_view
  @week_days_list ||= @message_page.get_week_days_list
end

When(/^I see the day starting from '(\w+)'$/) do |given_day|
  return @week_days_list[0].downcase == given_day[0..2].downcase
end

Then(/^I see the day ending at '(\w+)'$/) do
  return @week_days_list[6].downcase == given_day[0..2].downcase
end

Then(/^I select '*[Dd]ay'* view$/) do
  @message_page ||= MessagesPage.new(page)
  @message_page.click_day_view
end

Then(/^I see a published message$/) do
  @daily_messages_list = @message_page.get_messages_list
end

Then(/^I hover the mouse over platform icon$/) do
  @platform_icons = @daily_messages_list.first.all('[data-message-popover]')

  @post_accounts = []
  @platform_icons.each do |platform_icon|
    platform_icon.hover
    @publisher_platform = /^message-accounts-(.*)-.*$/.match(platform_icon['data-message-popover'])[1]
    @publisher_account_id = @message_page.get_popup_entry_inline_text
    @post_accounts.push([@publisher_platform, @publisher_account_id])
  end
end

Then(/^I click on the message$/) do
  @message_page ||= MessagesPage.new(page)
  if @daily_messages_list.size > 0
    @message_text = @daily_messages_list.first.find('.message-content').text
    @message_page.click_on_today_message
  end
end

Then(/^the message page opens successfully$/) do
  @daily_messages_list.size > 0
end

Then(/^I verify the platforms published$/) do
  @message_page ||= MessagesPage.new(page)
  if @daily_messages_list.size > 0
    @publisher_account_list = @message_page.get_publisher_accounts_list
    @publisher_account_list.each do |publisher_account|
      # here I get the attribute value data-original-title from publisher_account element
      @publisher_account = publisher_account['data-original-title']
      @published_platform = /^(.*)\b .*$/.match(@publisher_account)[1]
      @published_account = /^.*[:] (.*)$/.match(@publisher_account)[1]
      unless @post_accounts.include? [@published_platform, @published_account]
        return false
      end
    end
    true
  end
end

Then(/^I verify the exact message in the message window$/) do
  @message_page ||= MessagesPage.new(page)
  @published_messages = @message_page.get_published_message
  @published_message_text = @published_messages.first.find('[data-vh-id=truncatable]').text
  @message_text == @published_message_text
end

Then(/^I click on the messages dropdown$/) do
  @message_page ||= MessagesPage.new(page)
  @message_page.click_on_message_drop_down if @daily_messages_list.size > 0
end

Then(/^I select the first option "(.*?)"$/) do |arg1|
  @message_page ||= MessagesPage.new(page)
  if @daily_messages_list.size > 0
    @message_page.click_on_view_message_detail(arg1)
  end
end

Then(/^I should see the message details page$/) do
  @message_page ||= MessagesPage.new(page)
  @message_page.check_message_detail_opened if @daily_messages_list.size > 0
end

Then(/^I verify the message in the details page$/) do
  @message_page ||= MessagesPage.new(page)
  @published_messages = @message_page.get_published_message
  @published_message_text = @published_messages.first.find('[data-vh-id=truncatable]').text
  @message_text == @published_message_text
end

Then(/^I should be able to see the repost message modal$/) do
  @message_page ||= MessagesPage.new(page)
  @message_page.check_post_message_modal_opened
end

Then(/^I will just click on repost in publishing modal$/) do
  @message_page ||= MessagesPage.new(page)
  @message_page.click_on_post_message
end

Then(/^I see the message reposted in calendar$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should be able to see the page for editing tags and memo$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I enter "(.*?)" in memo$/) do |_arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I enter "(.*?)"$/) do |_arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I see the tags and memo update successfully in calendar$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should be able to see Rejection reasons page$/) do
  @message_page ||= MessagesPage.new(page)
  @message_page.check_rejections_modal_opened if @daily_messages_list.size > 0
end

Then(/^I close the page$/) do
  @message_page ||= MessagesPage.new(page)
  @message_page.close_page if @daily_messages_list.size > 0
end

Then(/^I click on the top left corner of the message$/) do
  @message_page.click_on_today_message_status if @daily_messages_list.size > 0
end

Then(/^I should see message status window$/) do
  @message_page.check_message_status_opened if @daily_messages_list.size > 0
end

Then(/^I close the Message status window$/) do
  @message_page.close_message_status
end

Then /^I select '(.*?)' view$/ do |view|
  @message_page ||= MessagesPage.new(page)
  @message_page.click_right_view(view)
end

Then(/^I select '*week'* view$/) do
  @message_page ||= MessagesPage.new(page)
  @message_page.click_week_view
end

Then(/^I select a published message$/) do
  @message_page ||= MessagesPage.new(page)
  @message_page.click_on_a_message
end

Then /^I change the timezone to '(.*?)'$/ do |time_zone|
  @message_page ||= MessagesPage.new(page)
  @message_page.select_time_zone(time_zone)
end

Then /^I verify the messages accurately in '(.*?)'$/ do |time_zone|
  @message_page ||= MessagesPage.new(page)
  @message_page.check_time_zone(time_zone)
end

Then(/^I select '*month'* view$/) do
  @message_page ||= MessagesPage.new(page)
  @message_page.click_month_view
end

Then(/^I click on more$/) do
  @message_page.click_message_trigger
end

Then(/^I see the message will expand$/) do
  @message_page.check_message_expanded
end

Then(/^I click on less$/) do
  @message_page.click_message_trigger
end

Then(/^I see the message gets shortened$/) do
  @message_page.check_message_collapsed
end

Then(/^I select to Upload images$/) do
  @message_page.click_on_upload_image
end

Then(/^I select '(.*?)' images by uploading$/) do |image_name|
  @message_page.upload_image(image_name)
end

Then(/^I enter the album name as '(.*?)'$/) do |facebook_album_name|
  @message_page.enter_facebook_album_name(facebook_album_name)
end

Then(/^I see the images and link in message snippet$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I hover on the time after 'now'$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I double click on any blank space$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I see the message in message snippet in 'day' view$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I see the message in message snippet in 'week' view$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I see the message in message snippet in 'month' view$/) do
  pending # express the regexp above with the code you wish you had
end

Then /^I open the filter$/ do
  @message_page ||= MessagesPage.new(page)
  @message_page.open_filter
end

Then /^I select '(.*?)' account$/ do |account|
  @message_page.choose_filter_option(account)
end

Then /^I finish the filter selection$/ do
  @message_page.finish_filtering
end

Then /^I verify the messages are filtered by '(.*?)'$/ do |account|
  result = @message_page.check_filtered_by(account)
  fail(ArgumentError.new("There are messages without the requested filter value on account")) unless result
end

Then /^I pick '(.*?)' as a navigation filter$/ do |navigation_filter|
  @message_page.pick_source_filter(navigation_filter)
end

Then /^I verify the messages are filtered by '(.*?)' accounts$/ do |accounts_list|
  result = @message_page.check_multiple_filtered_by(accounts_list)
  fail(ArgumentError.new("There are messages without the requested filter value on account")) unless result
end

Then /^I clear the filters$/ do
  @message_page.clear_filters
end

Then /^I verify messages are not filtered by '(.*?)'$/ do |accounts_list|
  result = @message_page.check_multiple_filtered_by(accounts_list)
  fail(ArgumentError.new("The messages are still being filtered")) if result
end

Then /^I search for '(.*?)' on filter search field$/ do |account|
  @message_page.search_filter(account)
end

Then /^I should see '(.*?)' as an account to filter$/ do |account|
  @message_page.is_filter_present?(account)
end

Then /^I should not see any filter entrie$/ do
  @message_page.no_entries?
end

Then /^I see the available download links$/ do
  result = @message_page.archives_available?
  fail(ArgumentError.new("There are not archives available")) unless result
end

Then /^I see the archives view$/ do
  result = @message_page.archives_view_shown?
  fail(ArgumentError.new("The archives view is not displayed")) unless result
end

Then /^I select '(.*?)' date$/ do |date_used|
  @message_page.pick_date(date_used)
end

Then /^I see archive for '(.*?)'$/ do |date_used|
  result = @message_page.archives_for_date(date_used)
  fail(ArgumentError.new("The archive is not generated!")) unless result
end

Then /^I see no archives available$/ do
  result = @message_page.archives_available?
  fail(ArgumentError.new("There are archives generated!")) if result
end