##########################################
#
# step definition for API call test
#
##########################################

Given /^I start testing API calls on '(.*?)'$/ do |platform|
  @viralheat_api = ViralheatAPI.new(platform)
end

When /^I test '(.*?)' API$/ do |api_name|
  @viralheat_api.send(api_name.to_sym).should == true
end

And /^I plan to test data integrity$/ do
  @viralheat_api.data_integrity = true
end
