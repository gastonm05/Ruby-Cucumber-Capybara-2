######################################################
#
# step definition for Facebook Mentioning pages Page
#
######################################################

Then /^I enter "(.*?)" on the search box$/ do |facebook_page|
  @fb_mentions_page = FacebookMentioningPage.new(page) unless @fb_mentions_page
  result = @fb_mentions_page.search_for_page(facebook_page)
  fail(ArgumentError.new("The pages are taking too long to load on the search")) unless result
end

Then /^I select "(.*?)" page on "(.*?)" section$/ do |page_index, section_locator|
  @fb_mentions_page = FacebookMentioningPage.new(page) unless @fb_mentions_page
  result = @fb_mentions_page.select_pages(page_index, section_locator)
  fail(ArgumentError.new("There are no pages on the #{section_locator} section")) unless result
end

Then /^I verify the page is on "(.*?)" section$/ do |section_locator|
  result = @fb_mentions_page.selected_page_on_section(section_locator)
  fail(ArgumentError.new("The page is not on the #{section_locator} section")) unless result
end

Then /^I verify the page is not on "(.*?)" section$/ do |section_locator|
  result = @fb_mentions_page.selected_page_on_section(section_locator)
  fail(ArgumentError.new("The page is on the #{section_locator} section and should not be")) if result
end

Then /^I enter "(.*?)" on the search box for already added pages$/ do |facebook_page|
  @fb_mentions_page = FacebookMentioningPage.new(page) unless @fb_mentions_page
  result = @fb_mentions_page.search_for_already_added_page(facebook_page)
  fail(ArgumentError.new("The pages are taking too long to load on the search")) unless result
end

Then /^I remove "(.*?)" page on "(.*?)" section if exists$/ do |page_index, section_locator|
  @fb_mentions_page = FacebookMentioningPage.new(page) unless @fb_mentions_page
  @fb_mentions_page.remove_pages(page_index, section_locator)
end

Then /^I remove "(.*?)" from the added pages$/ do |facebook_page|
  @fb_mentions_page = FacebookMentioningPage.new(page) unless @fb_mentions_page
  if @fb_mentions_page.has_already_added_pages?
    search_result = @fb_mentions_page.search_for_already_added_page(facebook_page)
    @fb_mentions_page.remove_pages("1", "existing pages")
    result = @fb_mentions_page.selected_page_on_section("existing pages")
    fail(ArgumentError.new("The page is on the existing pages section and should not be")) if result
  end
end
