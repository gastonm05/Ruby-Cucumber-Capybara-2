Given /^I login using page object$/ do
  @login_page = LoginPage.new(page, target_base_url)
  maximize_window
  @login_page.email = @user.username
  @login_page.password = @user.password
  @login_page.login
  @login_page.logged_in?(@user.display_name).should == true
  @source_accounts = SourceAccounts.new
end

Given /^I login using quick page object$/ do
  if @login_page.nil?
    @login_page = LoginPage.new(page, target_base_url)
    maximize_window
    @source_accounts = SourceAccounts.new
  end
  @login_page.email = @user.username
  @login_page.password = @user.password
  @login_page.quick_login(@user.display_name).should == true
end

Then /^I switch to '(.*?)' organization$/ do |org|
  @login_page.switch_organization(org)
end

Then /^I click on Publish button$/ do
  @publishing_modal = PublishingModal.new(page) if @publishing_modal.nil?
  @publishing_modal.start_publish
end

And /^I wait for (\d+) seconds/ do |amount|
  sleep(amount.to_i)
end

And /^I select Publish a message$/ do
  @publishing_modal.publish_a_message
end

And /^I select Bulk upload$/ do
  @publishing_modal.bulk_upload
end

Then /^I select to Upload image$/ do
  @publishing_modal.upload_image
end

And /^I choose to attach an image by URL "(.*?)"$/ do |image_url|
  @image_name = image_url
  @publishing_modal.attach_image_url(image_url)
end

And /^I edit the draft$/ do
  @publishing_modal.drafts
  @publishing_modal.edit_drafts
end

Then /^I click on attach file$/ do
  @publishing_modal.attach_file
end

Then /^I finish image attach$/ do
  @publishing_modal.done_image_attach
end

And /^I choose to attach an image "(.*?)" by uploading$/ do |image_name|
  @image_name = image_name
  @publishing_modal.attach_image_uploading(image_name)
end

Then /^I should see an error message$/ do
  result = @publishing_modal.error_present
  fail(ArgumentError.new("The error message is not present!")) unless result
end

And /^I should be able to see the image attached$/ do
  @publishing_modal.found_image_attached.nil?.should == false
end

And /^I select '(.*?)' accounts$/ do |accounts|
  accounts_array = accounts.split(',').map!(&:strip)
  @publishing_modal.accounts = @source_accounts.get_account(accounts_array)
end

And /^I select wordpress '(.+)' accounts$/ do |accounts|
  accounts_array = accounts.split(',').map!(&:strip)
  @publishing_modal.accounts = @source_accounts.get_account(accounts_array)
end

Then /^I add a title to the wordpress blog '(.+)'$/ do |title|
  @publishing_modal.wordpress_blog_title = title
end

Then /^I finish accounts selection$/ do
  @publishing_modal.done_account_select
end

Then /^I save as a group account called '(.+)'$/ do |group_account_name|
  @publishing_modal.save_accounts_group(group_account_name)
end

And /^I select following accounts:$/ do |table|
  raw_accounts = table.raw
  # Just get accounts' name
  accounts = raw_accounts[1..-1].flatten.select.each_with_index { |_accout, index| index.even? }
  @publishing_modal.accounts = accounts
end

And /^I add a message$/ do
  @publishing_modal.message = Faker::Lorem.sentence
end

And /^I add a message with a link '(.+)'$/ do |link|
  @publishing_modal.link = link
  @publishing_modal.message = Faker::Lorem.sentence + ' ' + link
end

And /^I add a message with a link using div locator '(.+)'$/ do |link|
  @publishing_modal.link = link
  @publishing_modal.message_using_div = Faker::Lorem.sentence + ' ' + link
end

Then /^I preview the link$/ do
  @publishing_modal.preview_link
end

And /^I am done with link preview$/ do
  @publishing_modal.preview_link_done
  #@publishing_modal.preview_attached?.should == true
  @publishing_modal.wait_for_publish_button
end

Then /^I shorten the link$/ do
  @publishing_modal.select_shorten_choice
  @publishing_modal.do_shorten_link
  @publishing_modal.done_shorten_link
end

Then /^I shorten the link using div$/ do
  @publishing_modal.select_shorten_choice
  @publishing_modal.do_shorten_link
  @publishing_modal.done_shorten_link_div
end

Then /^I add the approval chain '(.+)'$/ do |chain|
  @publishing_modal.select_approval_chain_choice
  @publishing_modal.pick_approval_chain(chain)
end

Then /^I add the approval chain created$/ do
  @org_settings = OrgSettings.new(page) if @org_settings.nil?
  @publishing_modal.select_approval_chain_choice
  @publishing_modal.pick_approval_chain(@org_settings.get_chain_name)
end

Then /^I publish the message$/ do
  @publishing_modal.publish
end

And /^I verify the published message along with link and pin$/ do
  visit "#{target_base_url}/messages/day"
  page.all(:css, ".message.big [src*='#{@image_name}']").size > 0 and page.all('.message-content', :text => "#{@publishing_modal.link}").size > 0 and page.all('.message-content', :text => @publishing_modal.message)
end

And /^I verify the published message is fetched in stream$/ do
  visit "#{target_base_url}/stream"
  page.all('.description', :text => @publishing_modal.message.gsub(@publishing_modal.link, '')).size > 0
end

Then /^I verify the message in calendar$/ do
  @publishing_modal.published?.should == true
  @publishing_modal.back
end

Then /^I verify message with shortened link in calendar$/ do
  @publishing_modal.published?.should == true
  @publishing_modal.back
end

Then /^I verify scheduled message with shortened link in calendar$/ do
  @publishing_modal = PublishingModal.new(page) if @publishing_modal.nil?
  @message_page = MessagesPage.new(page) if @message_page.nil?
  response =  @publishing_modal.get_message_content
  puts response
  @message_page.scheduled?(@publishing_modal.get_message_content.to_str).should == true
  @publishing_modal.back
end

Then /^I verify approved message in calendar$/ do
  @message_page.approved?(@publishing_modal.get_message_content).should == true
  @message_page.close_paper
end

And /^I test publish the message$/ do
  @publishing_modal.publish
  @publishing_modal.published?.should == true
end

And /^I see the message published with campaign tracking$/ do
  result = @publishing_modal.published_with_tracking?
  result.should == true
end

And /^I logout using newui$/ do
  @login_page.logout
end

Then /^I attach campaign tracking to the message$/ do
  @publishing_modal.campaign_tracking = 'Autoqa'
end

Then /^I attach campaign tracking '(.*?)' to the message$/ do |campaing_name|
  @publishing_modal.campaign_tracking = campaing_name
end

When /^I select '(.*)'$/ do |selected_group|
  @publishing_modal.select_accounts_group(selected_group)
end

And /^the link is shown on the sources web page$/ do
  pending
end

Then /^I verify the messages from redis published more than (\d+) mins ago$/ do |mins|
  @publishing_modal = PublishingModal.new(page)
  @publishing_modal.verify_redis_messages(mins.to_i)
end

And /^I save it as a draft$/ do
  @publishing_modal.save_draft
end

Then /^I should see it on Draft page$/ do
  @publishing_modal.verify_draft.nil?.should === false
end

Then /^I delete the draft message$/ do
  @publishing_modal.delete_draft
end

And /^I remove the attached image$/ do
  @publishing_modal.remove_image
end

Then /^I should see the image being removed$/ do
  @publishing_modal.no_image_attached?.should === true
end

And /^I schedule the message$/ do
  @publishing_modal.start_schedule
  @publishing_modal.schedule_message_immediately
  @publishing_modal.done_schedule
end

And /^I schedule the message tomorrow$/ do
  @publishing_modal.start_schedule
  @publishing_modal.schedule_message_next_day
  @publishing_modal.done_schedule
end

And /^I wait for (\d+) minutes$/ do |min_amount|
  sleep(min_amount.to_i * 60)
end

Then /^show me the page$/ do
  save_and_open_page
end

Then /^I navigate to messages page$/ do
  if @message_page.nil?
    @message_page = MessagesPage.new(page)
  else
    @message_page.go_to_messages_page
  end
end

Then /^I approve the message$/ do
  @publishing_modal = PublishingModal.new(page) if @publishing_modal.nil?
  @message_page.approve_message(@publishing_modal.get_message_content).should == true
end

Then /^I reject the message$/ do
  @publishing_modal = PublishingModal.new(page) if @publishing_modal.nil?
  @message_page.reject_message(@publishing_modal.get_message_content)
end

Then /^I edit the message under review$/ do
  @publishing_modal = PublishingModal.new(page) if @publishing_modal.nil?
  @message_page.edit_message(@publishing_modal.get_message_content)
  @publishing_modal.message_using_div = Faker::Lorem.sentence
  @publishing_modal.publish
  @message_page.close_paper
end

Then /^I edit the message rejected$/ do
  @publishing_modal = PublishingModal.new(page) if @publishing_modal.nil?
  @message_page.edit_message(@publishing_modal.get_message_content)
  @publishing_modal.message_using_div = Faker::Lorem.sentence
  @publishing_modal.publish
  @message_page.close_paper
end

Then /^I delete the message under review$/ do
  @publishing_modal = PublishingModal.new(page) if @publishing_modal.nil?
  @message_page.delete_message(@publishing_modal.get_message_content)
end

Then /^I delete the rejected message$/ do
  @publishing_modal = PublishingModal.new(page) if @publishing_modal.nil?
  @message_page.delete_message(@publishing_modal.get_message_content)
end

Then /^I edit the message which is approved$/ do
  @publishing_modal = PublishingModal.new(page) if @publishing_modal.nil?
  @message_page.edit_message(@publishing_modal.get_message_content)
  @publishing_modal.message_using_div = Faker::Lorem.sentence
  @publishing_modal.publish
  @message_page.close_paper
  sleep(3)
end

Then /^I see the message for review in calendar$/ do
  @publishing_modal = PublishingModal.new(page) if @publishing_modal.nil?
  @message_page = MessagesPage.new(page) if @message_page.nil?
  @message_page.scheduled?(@publishing_modal.get_message_content).should == true
  @publishing_modal.back
end

Then /^I verify the scheduled and approved message ready for publishing$/ do
  @publishing_modal = PublishingModal.new(page) if @publishing_modal.nil?
  @message_page = MessagesPage.new(page) if @message_page.nil?
  @message_page.scheduled_for_review?(@publishing_modal.get_message_content).should == true
end

Then /^I click on schedule button$/ do
  @publishing_modal.publish
end

Then /^I select the message under review$/ do
  @publishing_modal = PublishingModal.new(page) if @publishing_modal.nil?
  @message_page = MessagesPage.new(page) if @message_page.nil?
  @message_page.select_message(@publishing_modal.get_message_content)
end

Then /^I do not view '(.*?)' button$/ do |button|
  page.should have_no_selector(@message_page.get_locator(button))
end

Then /^I see '(.*?)' as approver of the message$/ do |approver_name|
  @message_page.is_approver_present?(approver_name).should == true
end

And /I clear all the scheduled messages/ do
  wd.find_element(:xpath, "//ul[@id='main-sidebar']//span[.='Messages']").click

  no_of_messages = wd.find_elements(:css, '.message.pending').size
  (0..no_of_messages - 1).each do |_index|
    page.has_css?('.message.pending').should be_true
    page.first('.message.pending').find("[data-action='delete']").click
    sleep 3
    page.find('a', text: 'Delete message').click
    sleep 5
  end
end

Then /^I click on bulk schedule$/ do
  page.find("[data-toggle='modal'][data-content-handler='bulk']").click
end

And /^I upload a csv file '(.*?)'/ do |file_name|
  Capybara.ignore_hidden_elements = false
  wd.find_element(:css, 'div.upload-content input').send_keys("#{Rails.root}/features-2.0/support/data/#{file_name}")
end

Then /^I find the uploaded messages scheduled$/ do
  # Now delete the message
  main_div = page.first("[data-behavior='message']")
  run_patiently { main_div.find("[data-action='delete']") }.click
  run_patiently { page.find_link('Delete message') }.click
  run_patiently { page.find('.messages-root').has_no_css?('.message') }
  page.find('.messages-root').all('.message').length.should == 0
end

Then /^I find the uploaded messages in the review section$/ do
  visit "#{target_base_url}/messages/require_review"
  page.has_css?("[data-behavior='message']").should be true
end

Then /^I click on schedule$/ do
  # click Schedule
  @publishing_modal.publish
  run_patiently(40) { page.has_text?('Your messages have been scheduled.').should be_true }
end

Then /^I generate the message in file '(.*?)' dynamically from '(.*)'$/ do |target_file, bulk_template_file|
  # Read template content
  file = File.open("#{Rails.root}/features-2.0/Support/data/#{bulk_template_file}", 'r')
  file_content = file.read
  file.close

  messages_list = file_content.replace_with_messages

  # Create new file for uploading
  new_file = File.new("#{Rails.root}/features-2.0/Support/data/#{target_file}", 'w+')
  new_file.puts(file_content)
  new_file.close

  # Generate a list of messages used to replace in the bulk uploading template
  @publishing_modal.set_messages(messages_list)
end

Then /^I generate a csv template file '(.*?)' from '(.*?)' to publish tomorrow$/ do |target_file, date_template_file|
  file = File.open("#{Rails.root}/features-2.0/Support/data/#{date_template_file}", 'r')
  file_content = file.read
  file.close

  file_content.replace_with_date(Date.today + 1)
  messages_list = file_content.replace_with_messages

  new_file = File.new("#{Rails.root}/features-2.0/Support/data/#{target_file}", 'w+')
  new_file.puts(file_content)
  new_file.close

  # Generate a list of messages used to replace in the bulk uploading template
  @publishing_modal.set_messages(messages_list)
end

Then /^I verify the message in calendar on tomorrow$/ do
  @publishing_modal.scheduled_tomorrow?.should == true
  @publishing_modal.back
end

And(/^I select an image set of 6 images for uploading$/) do
  @publishing_modal.attach_multiple_images
end

And(/^I insert '(.*?)' as album name for facebook$/) do |album_name|
  @publishing_modal.insert_album_name_fb(album_name)
end

And(/^I see the limit set for twitter images upload$/) do
  @publishing_modal.verify_twitter_limit
end

And(/^I should be able to see '(.*?)' images attached$/) do |image_number|
  @publishing_modal.verify_image(image_number)
end

Then(/^I verify the publish was succesfully$/) do
  @publishing_modal.verify_publish
end

And(/^I delete first image$/) do
  @publishing_modal.delete_image
end

And(/^I select facebook targeting$/) do
  @publishing_modal.fb_targeting
end

And(/^I select '(.*?)' as country to target on facebook$/) do |target_country|
  @publishing_modal.select_target(target_country)
end

And(/^I verify that just the first image will be publish on facebook$/) do
  @publishing_modal.fb_targeting_message
end


And(/^I select '(.*?)' for uploading$/) do |image_name|
  @publishing_modal.attach_image_uploading(image_name)
end

Then(/^I enter '(.*?)' as board name for pinterest$/) do |board_name|
  @publishing_modal.board_name(board_name)
end

Then(/^I enter board name for pinterest$/) do
  board_name ||= Faker::Lorem.sentence
  @publishing_modal.board_name(Faker::Lorem.sentence)
end

#this step is due to some issues on the existing step only on some scenarios
Then /^I enter '(.*?)' as pinterest board name$/ do |board_name|
  @publishing_modal.set_board_name(board_name)
end

And(/^I enter '(.*?)' as board description for pinterest$/) do |board_description|
  @publishing_modal.board_description(board_description)
end

And(/^I verify there is a board '(.*?)'$/) do |board_name|
  @publishing_modal.verify_board_name(board_name)
end

And(/^I verify the board description is '(.*)'$/) do |board_description|
  @publishing_modal.verify_board_description(board_description)
end

And(/^I click on edit the board button$/) do
  @publishing_modal.click_edit_board
end

And(/^I click on delete the board$/) do
  @publishing_modal.click_delete_button
end

When(/^I select account '(.*?)' to publish$/) do |account|
  @publishing_modal.select_account(account)
end

And(/^I log in to Pinterest with username '(.*?)' and password '(.*?)'$/) do |username, password|
  @publishing_modal.login_pinterest_platform(username, password)
end

And(/^I click on the board '(.*?)'$/) do |board_name|
  @publishing_modal.click_board_name(board_name)
end


And(/^I switch Selenium current page for the new tab opened$/) do
  @publishing_modal.switch_selenium_page
end

And(/^I switch back to Selenium current page from the new tab opened$/) do
  @publishing_modal.switchback_selenium_page
end

And(/^I close the browser$/) do
  @publishing_modal.close_browser
end


And(/^I close the new tab$/) do
  @publishing_modal.close_tab
end

And(/^I do not see board description$/) do
  @publishing_modal.verify_board_description_empty
end

And(/^I verify the message for '(.*?)' publishing in summary$/) do |board_name|
  @publishing_modal.verify_board_summary(board_name)
end

And(/^I enter '(.*?)' as message$/) do |message|
  @publishing_modal.enter_message(message)
end

And(/^I verify there is a message in the calendar with '(.*?)'$/) do |description|
  @publishing_modal.verify_message_calendar(description)
end

Then /^I verify the pin is on stream$/ do
  result = @publishing_modal.verify_pinterest_post
  fail(ArgumentError.new("The text searched is not the showed one")) unless result
end

Then /^I open the pin status$/ do
  @publishing_modal.open_message_status
end

Then /^I delete the pin$/ do
  @publishing_modal.delete_pin
end

Then /^I verify the pin is deleted$/ do
  @publishing_modal.reload_page
  result = @publishing_modal.open_message_status
  fail(ArgumentError.new("The pin searched was not deleted")) if result
end

Then /^I navigate to explore page$/ do
  if @explore_page.nil?
    @explore_page = ExplorePage.new(page)
  else
    @explore_page.go_to_explore_page
  end
end

Then /^I add '(.*?)' as mention$/ do |mention_page|
  @publishing_modal.enter_message("@#{mention_page}")
end

Then /^I select the option for mentioning$/ do
  @publishing_modal.pick_mention
end

Then /^I verify scheduled message is the right one$/ do
  @publishing_modal = PublishingModal.new(page) if @publishing_modal.nil?
  result = @publishing_modal.check_schedule_time
  fail(ArgumentError.new("The messages are still being filtered")) if result
end

Then /^I verify the message in calendar on the right slot$/ do
  pending # Write code here that turns the phrase above into concrete actions
end

Then /^I verify the schedule message is '(.*?)'$/ do |intern_tag|
  result = @publishing_modal.check_schedule_message(intern_tag)
  fail(ArgumentError.new("The Account counter for schedule is wrong")) unless result
end

Then /^I verify the format message is shown$/ do
  result = @publishing_modal.check_format_message
  fail(ArgumentError.new("The format message is wrong")) unless result
end

Then /^I verify the empty file is not allowed$/ do
  result = @publishing_modal.empty_file_error
  fail(ArgumentError.new("The empty file was accepted")) unless result
end

Then /^I approve the message new_method$/ do
  @publishing_modal = PublishingModal.new(page) if @publishing_modal.nil?
  result = @message_page.approve_message_new(@publishing_modal.get_published_message_id)
  fail(ArgumentError.new("Can't approve the message with id: '#{@publishing_modal.get_published_message_id}', " +
    "content: #{@publishing_modal.get_message_content}")) unless result
end

Then /^I reject the message new_method$/ do
  @publishing_modal = PublishingModal.new(page) if @publishing_modal.nil?
  result = @message_page.reject_message_new(@publishing_modal.get_published_message_id)
  fail(ArgumentError.new("Can't reject the message with id: '#{@publishing_modal.get_published_message_id}', " +
    "content: #{@publishing_modal.get_message_content}")) unless result
end

Then /^I edit the message rejected new_method$/ do
  @publishing_modal = PublishingModal.new(page) if @publishing_modal.nil?
  result = @message_page.edit_message_new(@publishing_modal.get_published_message_id)
  fail(ArgumentError.new("Can't edit the message with id: '#{@publishing_modal.get_published_message_id}', " +
    "content: #{@publishing_modal.get_message_content}")) unless result
end

Then /^I delete the rejected message new_method$/ do
  @publishing_modal = PublishingModal.new(page) if @publishing_modal.nil?
  result = @message_page.delete_message_new(@publishing_modal.get_published_message_id)
  fail(ArgumentError.new("Can't delete the message with id: '#{@publishing_modal.get_published_message_id}', " +
    "content: #{@publishing_modal.get_message_content}")) unless result
end

Then /^I edit the message which is approved new_method$/ do
  @publishing_modal = PublishingModal.new(page) if @publishing_modal.nil?
  result = @message_page.edit_message_new(@publishing_modal.get_published_message_id)
  fail(ArgumentError.new("Can't edit the message with id: '#{@publishing_modal.get_published_message_id}', " +
    "content: #{@publishing_modal.get_message_content}")) unless result
end

Then /^I verify scheduled message in calendar new_method$/ do
  @publishing_modal = PublishingModal.new(page) if @publishing_modal.nil?
  @message_page = MessagesPage.new(page) if @message_page.nil?
  #@publishing_modal.published?.should == true
  #@publishing_modal.back
  result = @message_page.scheduled_message_new(@publishing_modal.get_published_message_id)
  fail(ArgumentError.new("Can't check for message with id: '#{@publishing_modal.get_published_message_id}', " +
    "content: #{@publishing_modal.get_message_content}")) unless result
end

Then /^I see the message for review in calendar new_method$/ do
  @publishing_modal = PublishingModal.new(page) if @publishing_modal.nil?
  @message_page = MessagesPage.new(page) if @message_page.nil?
  result = @message_page.on_calendar?(@publishing_modal.get_published_message_id)
  fail(ArgumentError.new("Can't check for message with id: '#{@publishing_modal.get_published_message_id}', " +
    "content: #{@publishing_modal.get_message_content}")) unless result
end

