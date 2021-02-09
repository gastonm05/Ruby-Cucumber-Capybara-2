Given /^I am an existing user '(.*?)'$/ do |account_name|
  @user = User.new(account_name)
end
