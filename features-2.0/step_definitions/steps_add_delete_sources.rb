
Then /^I navigate to sources page$/ do
  @sources_page = SourcesPage.new(page)
end

Given(/^I connect my linkedin account$/) do
  pending
end

# this twitter account is associated to autoqa+1@viralheat.com email
# though login/adding source can be done with alias & password
Then /^I connect my twitter account using newui$/ do
  @sources_page.filter_twitter
  @sources_page.delete_source('testerfb11')
  @sources_page.connect_twitter('testerfb11@gmail.com', 'mko09ijn')
end

Then /^I connect my facebook account using newui$/ do
  @sources_page.filter_facebook
  @sources_page.delete_source('Tester Tes')
  @sources_page.connect_facebook('testerfb11@gmail.com', 'nji98uhb', 'Xom')
end

Given(/^I can connect my google\+ account$/) do
  @sources_page.filter_google
  @sources_page.delete_source('Testerfb11 Test')
  @sources_page.connect_google('testerfb11@gmail.com', 'nji98uhb').should == true
end

Given(/^I can connect my Tumblr account$/) do
  @sources_page.filter_tumblr
  @sources_page.delete_source('testerfb11')
  # @sources_page.connect_tumblr('testerfb11@gmail.com', 'nji98uhb')
end

Given(/^I can connect my Wordpress account$/) do
  @sources_page.filter_wordpress
  @sources_page.delete_source('classicalmus123')
  @sources_page.connect_wordpress('testerfb11@gmail.com', 'nji98uhb')
end

Given(/^I can connect my Instagram account$/) do
  @sources_page.filter_instagram
  @sources_page.delete_source('testerfb11')
  @sources_page.connect_instagram('testerfb11', ',lp-0okm')
end

#   Given(/^I can connect my Foursquare account$/) do
#     @sources_page.filter_foursquare
#     @sources_page.delete_source('Tester te')
#     @sources_page.connect_foursquare('testerfb11@gmail.com', 'mko09ijn')
#   end
#
#   When(/^I can connect my Foursquare account to org$/) do
#     @sources_page.filter_foursquare
#     @sources_page.add_foursquare('Tester te')
#   end

Then(/^I can connect my linkedin account$/) do
  pending
end

Then(/^I can connect my Twitter account to org$/) do
  @sources_page.filter_twitter
  @sources_page.add_twitter('testerfb11')
end

Then(/^I can connect my Facebook account to org$/) do
  @sources_page.filter_facebook
  @sources_page.add_facebook('Xom')
end

Then(/^I can add my google\+ account to org$/) do
  @sources_page.filter_google
  @sources_page.add_google('Testerfb11 Test')
end

Then(/^I can add my Tumblr account to org$/) do
  @sources_page.filter_tumblr
  @sources_page.add_tumblr('testerfb11')
end

Then(/^I can add my Wordpress account to org$/) do
  @sources_page.filter_wordpress
  @sources_page.add_wordpress('classicalmus123')
end

Then(/^I can add my Instagram account to org$/) do
  @sources_page.filter_instagram
  @sources_page.add_instagram('testerfb11')
end

And(/^I delete existing source group named '(.*?)'$/) do |_group_name|
  pending
end

Then /^I click on Add new Source$/ do
  @sources_page.add_new_source
end

Then /^I click on '(.*?)' option$/ do |option|
  @sources_page.select_option(option)
end

Then /^I enter a name for the Topic Profile$/ do
  @sources_page.enter_topic_profile_name = Faker::Lorem.word
end

Then /^I enter '(\d+)' terms$/ do |times|
  @sources_page.enter_terms(times)
end

Then /^I remove '(\d+)' terms$/ do |times|
  @sources_page.remove_terms(times)
end

Then /^my topic should be visible$/ do
  @sources_page.is_topic_profile_present?.should == true
end

Then /^I click on Create button for sources$/ do
  @sources_page.click_create
end

Then /^I delete the Topic Profile created$/ do
  @sources_page.delete_topic_profile.should == true
end

Then /^my topic should not be visible$/ do
  @sources_page.is_topic_profile_present?.should == false
end

Then /^I delete all the Topic Profiles created here$/ do
  @sources_page.delete_all_temporal_topic_profiles
end


When(/^I select 'pinterest' from left menu$/) do
  @sources_page.filter_pinterest
end

When(/^I click on add source button in the center of page$/) do |arg|
  @page.find(input_elements[:add_source_button]).click
end

And(/^I connect to pinterest using '(.*?)' and '(.*?)'$/) do |username, password|
  @sources_page.connect_pinterest(username, password)
end

Then(/^I authorize the 'pinterest' account$/) do
  @sources_page
end

Then(/^I authorize the pinterest account$/) do
  @sources_page.authorize_pinterest
end

And(/^I verify the pinterest account in sources page has been '(.*?)'$/) do |state|
  @sources_page.verify_account_added(state)
end


And(/^I delete '(.*?)' account$/) do |account|
  @sources_page.delete_source(account)
end

Then(/^I select pinterest$/) do
  @sources_page.select_pinterest
end

And(/^I see that no accounts present$/) do
  @sources_page.verify_no_sources
end

When(/^I click on Add new Sources button in the center of page$/) do
  @sources_page.click_sources_button
end

When(/^I click on the 'add a new source' button$/) do
  @source_page.add_new_source_button
end

And(/^I click on Add sources button when empty sources$/) do
  @sources_page.add_sources_button
end

And(/^I verify the pinterest account in sources page has been added$/) do
  @sources_page.verify_source_added
end

And(/^I verify the source has been deleted$/) do
  @sources_page.verify_source_deleted
end

And(/^I select view on platform for '(.*?)'$/) do |account_name|
  @sources_page.view_platform(account_name)
end

When(/^I select account '(.*?)'$/) do |account|
  @sources_page = SourcesPage.new(page)
  @sources_page.choose_account(account)
end