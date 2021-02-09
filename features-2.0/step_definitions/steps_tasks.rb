Then /^I navigate to tasks page$/ do
  @tasks_page = TasksPage.new(page)
  @tasks_page.go_to_tasks_page
end

Then /^I open the task '(.*?)'$/ do |task_name|
  @tasks_page.open_task_created(task_name)
end

Then /^I see that the tag is present$/ do
  @tasks_page.verify_tag_present
end

Then /^I enter description '(.*?)' to the task$/ do |desc|
  @tasks_page = TasksPage.new(page) if @tasks_page.nil?
  @tasks_page.enter_description_to_task_assignment(desc)
end

Then /^I enter tags as '(.*?)' and due date as '(.*?)'$/ do |tag, due_date|
  @tasks_page.add_tags(tag)
  @tasks_page.add_due_date(due_date)
end

Then /^I click on assign task$/ do
  result = @tasks_page.complete_tagging_task
  fail(ArgumentError.new("The tag is not present on the task and should be there")) unless result
end

Then /^I should be able to click on the tag inside the post on the task$/ do
  @tasks_page.click_on_tag
end

Then /^I verify the relevant results fetched in new window$/ do
  @tasks_page.change_focus_to_new_window
  result = @tasks_page.check_tag_on_stream
  fail(ArgumentError.new("The tag is not present on at least one of the Stream Posts")) unless result
end

Then /^I refresh the page$/ do
  visit page.driver.browser.current_url
end

Then /^I change the tags from more dropdown on task page$/ do
  @tasks_page.click_on_change_tags
end

Then /^I see the tag deleted from post$/ do
  result = !@tasks_page.check_tag_on_stream
  fail(ArgumentError.new("The tag is present on at least one of the Stream Posts")) unless result
end

Then /^I see the tag replaced from post$/ do
  result = !@tasks_page.check_tag_on_stream
end

Then /^I verify the page navigation to tasks page$/ do
  result = @tasks_page.is_tasks_url?
  fail(ArgumentError.new("We are not into Tasks page")) unless result
end

Then /^I update the task$/ do
  result = @tasks_page.complete_tagging_task
  fail(ArgumentError.new("The tag is not present on the task and should be there")) unless result
end


Then /^I click on edit for tags on task page$/ do
  @tasks_page.click_on_edit
end