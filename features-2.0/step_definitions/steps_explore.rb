
When(/^I navigate to explore$/) do
  @explore_page ||= ExplorePage.new(page)
end

And(/^I enter "([^"]*)" keyword to search$/) do |keyword|
  @explore_page.search_keyword(keyword)
end

And(/^I select Instagram from dropdown$/) do
  @explore_page.select_instagram
end


And(/^I select "([^"]*)" from dropdown$/) do |platform|
  @explore_page.select_platform(platform)
end

Then(/^I click on search$/) do
  @explore_page.search_button
end

And(/^I select to comment the first post$/) do
  @explore_page.comment_first_post
end

And(/^I select "([^"]*)" account$/) do |account|
  @explore_page.select_account(account)
end

And(/^I comment the post with "([^"]*)"$/) do |comment_text|
  @explore_page.comment(comment_text)
end

And(/^I wait for "([^"]*)" seconds$/) do |n|
  sleep(n.to_i)
end

And(/^I delete the comment "([^"]*)"$/) do |comment_to_delete|
  @explore_page.delete_comment(comment_to_delete)
end

And(/^I verify there is no more comment containing "([^"]*)"$/) do |comment_to_verify|
  @explore_page.verify_comment_remove(comment_to_verify)
end

Then(/^I click on save button$/) do
  @explore_page.save_button
end

And(/^I enter a random name for the search$/) do
  @explore_page.insert_name
end

And(/^I see the search name previously entered$/) do
  @explore_page.search_present
end

And(/^I update the search with a random name$/) do
  @explore_page.update_name
end


And(/^I see the updated search name previously entered$/) do
  @explore_page.search_updated
end

Then(/^I see results containing the twitter user "([^"]*)"$/) do |twitter_user|
  @explore_page.twitter_user_check(twitter_user)
end

Then(/^Search results should reflect the keyword "([^"]*)"$/) do |keyword|
  @explore_page.verify_results(keyword)
end

And(/^I navigate to saved searches and click on the created search$/) do
  @explore_page.navigate_saved_searches
end

And(/^I navigate to Manage your searches page$/) do
  @explore_page.manage_searches_page
end

And(/^I delete all the saved searches$/) do
  @explore_page.delete_saved_searches
end
