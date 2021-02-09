Given /^I select '(.*?)' Settings$/ do |account|
  @org_settings = OrgSettings.new(page) if @org_settings.nil?
  @org_settings.account_setting(account)
end

And /^I click on '(.*?)' button$/ do |option|
  @org_settings.click_button(option)
end

Then /^I see that '(.*?)' is selected in the list$/ do |option|
  @org_settings.is_selected?(option)
end

Then /^I delete the approval chain '(.*?)'$/ do |chain_name|
  @org_settings.delete_chain(chain_name)
end

#######################################
#
# Authorizations
#
#######################################

And /^I click on Authorizations$/ do
  @org_settings.authorizations
end

And /^I select '(.*?)' permission$/ do |permission_link|
  @org_settings.click_on_permission_link(permission_link)
end

And /^I select the '(.*?)' for '(.*?)'$/ do |permission, permission_link|
  @org_settings.click_on_permission_link(permission_link)
  @org_settings.click_on_permission_option(permission)
end

And /^I deselect the '(.*?)' for '(.*?)'$/ do |permission, permission_link|
  @org_settings.click_on_permission_link(permission_link)
  @org_settings.remove_permission_option(permission)
end

#######################################
#
# Members
#
#######################################

And /^I click on Members$/ do
  @org_settings.members
end

And /^I see '(.*?)' button for '(.*?)' is disabled$/ do |button, user|
  @org_settings.is_button_for_user?(button, user, 'disabled').should == true
end

Then /^I try to delete '(.*?)'$/ do |user|
  @org_settings.click_button_for_user('delete', user, 'click')
  @org_settings.click_continue_danger
end

Then /^I try to edit the '(.*?)' member role$/ do |user|
  @org_settings.click_button_for_user('edit', user, 'click')
end

Then /^I change the role to '(.*?)'$/ do |role|
  @org_settings.change_role(role)
  @org_settings.click_continue_primary
end

Then /^I see an error message after I click on '(.*?)'$/ do |_button|
  @org_settings.is_error_present?.should == true
end

#######################################
#
# Approval Chains
#
#######################################

And /^I click on Approval chains$/ do
  @org_settings.approval_chains
end

And /^I click on add approval chain link$/ do
  @org_settings.add_approval_chain
end

And /^I select '(.*?)' as approver$/ do |user|
  @org_settings.pick_approver(user)
end

Then /^I name the chain as '(.*?)'$/ do |chain_name|
  @org_settings.set_chain_name(chain_name)
end

Then /^I name the chain with random name$/ do
  @org_settings.set_chain_name(Faker::Name.name)
end

Then /^I do not see delete button over the created approval chain in use$/ do
  @org_settings.is_button_present_on_chain?('delete', @org_settings.get_chain_name).should == false
end

Then /^I try to remove '(.*?)' as approver from created approval chain$/ do |user|
  @org_settings.edit_chain(@org_settings.get_chain_name)
  @org_settings.warning_message_present?.should == true
  @org_settings.pick_approver(user).should == false
end

Then /^I delete the approval chain created$/ do
  @org_settings.delete_chain(@org_settings.get_chain_name)
end

Then /^I edit '(.*?)' by '(.*?)' '(.*?)' as approver$/ do |chain_name, _action, user|
  @org_settings.edit_chain(chain_name)
  @org_settings.pick_approver(user)
end

Then /^I select approval chain '(.*?)'$/ do |chain_name|
  @org_settings.edit_chain(chain_name)
end

Then /^I select '(.*?)' as default$/ do |chain_name|
  @org_settings.set_chain_as_default(chain_name)
end

Then /^I deselect '(.*?)' as default$/ do |chain_name|
  @org_settings.remove_chain_as_default(chain_name)
end

Then /^I do not see delete button over the '(.*?)' approval chain in use$/ do |chain_name|
  # @org_settings.is_button_present_on_chain?("edit", chain_name).should == false
  @org_settings.is_button_present_on_chain?('delete', chain_name).should == false
end

Then /^I try to remove '(.*?)' as approver from '(.*?)' approval chain$/ do |user, chain_name|
  @org_settings.edit_chain(chain_name)
  @org_settings.warning_message_present?.should == true
  @org_settings.pick_approver(user).should == false
end

#######################################
#
# Publishing Campaigns
#
#######################################

Then /^I click on Campaigns$/ do
  @org_settings.campaigns
end

Then /^I add new publishing campaign$/ do
  @org_settings.add_publishing_campaign
end

Then /^I select Google Analytics$/ do
  @org_settings.select_google_analytics
end

Then /^I add parameters$/ do
  @org_settings.add_tracking_parameters
end

Then /^I name the campaign tracking as '(.*?)'$/ do |campaign_name|
  @org_settings.set_campaign_name(campaign_name)
end

Then /^I click on save$/ do
  @org_settings.save_publishing_campaign
end

Then /^I delete the campaign '(.*?)'$/ do |campaign_name|
  @org_settings.delete_campaign(campaign_name)
end

#######################################
#
# Organization General
#
#######################################

Then /^I select General Settings$/ do
  @org_settings.general
end

Then /^I uncheck the box for always attach campaign tracking$/ do
  @org_settings.uncheck_campaign_tracking
end

Then /^I check the box for always attach campaign tracking$/ do
  @org_settings.check_campaign_tracking
end

Then /^I should see '(.*?)' campaign tracking being created$/ do |campaign_name|
  @org_settings.check_campaign(campaign_name).nil?.should == false
end
