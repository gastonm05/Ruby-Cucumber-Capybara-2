Given /^I select settings$/ do
  @personal_settings = PersonalSettings.new(page) if @personal_settings.nil?
  @personal_settings.start_setting
end

Given /^I select Personal Settings$/ do
  @personal_settings.personal_setting
end

And /^I click on URL Shortening$/ do
  @personal_settings.url_shortening
end

Then /^I click on Facebook$/ do
  @personal_settings.facebook
end

Then /^I can customize '(.*?)' as my default URL Shortening service$/ do |customize_service|
  @personal_settings.set_custom_service(customize_service)
end

Then /^I can select '(.*?)' as my default URL Shortening service$/ do |shorten_service|
  @personal_settings.set_url_service(shorten_service)
end

Then /^I should see '(.*?)' set as default URL Shortening service$/ do |shorten_service_name|
  run_patiently(5) { @personal_settings.default_shortening?(shorten_service_name).should == true }
end

And /^I click on Templates$/ do
  @personal_settings.templates
end

Then /^I click on Create Template$/ do
  @personal_settings.create_template
end

When /^I add message to the template with a random name$/ do
  @temp_name = @personal_settings.add_template_info
end

Then /^I can see my template being created$/ do
  @personal_settings.check_template(@temp_name).nil?.should == false
end

Then /^I can delete the template I just created$/ do
  @personal_settings.delete_template(@temp_name)
end

Then /^I go to template page$/ do
  @personal_settings.go_to_templates_page
end

And /^I select the template I just created$/ do
  @personal_settings.select_template(@temp_name)
end


Then(/^I clear all the templates created$/) do
  @personal_settings.delete_all_templates
end