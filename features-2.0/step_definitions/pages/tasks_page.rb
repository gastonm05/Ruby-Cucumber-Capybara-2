class TasksPage < BasePage
  def initialize(page)
    @page = page
  end

  def go_to_tasks_page
    @page.visit(target_base_url + "/tasks") if @page.current_path != "/tasks"
  end

  def get_entries
    @page.all(input_elements[:tasks_list])
  end

  #--------------------- Web Elements ---------------------
  #def advanced() @page.find(input_elements[:advanced]) end

  def enter_description_to_task_assignment(desc)
    @page.find(input_elements[:description_field]).set(desc)
    @task_name = desc
  end

  def add_tags(tag)
    wait_for_css(input_elements[:tag_input_field])
    @page.find(input_elements[:tag_input_field]).set(tag)
    @page.find(input_elements[:tag_selected]).click
    @tag_used = tag
  end

  def is_tasks_url?
    return @page.current_url.include?("/tasks/")
  end

  def add_due_date(due_date)
    @page.find(input_elements[:due_date_field])
    @due_date = due_date
  end

  #This method clicks on the 'change tags' button to complete the tagging task
  #@author Fernando Gallo
  def complete_tagging_task
    @page.find(input_elements[:change_tags_button]).click
  end

  #This method clicks on the 'more' link located on the streap post and then on the 'change_tags' option
  #@author Fernando Gallo
  def click_on_change_tags
    @page.find(input_elements[:result_more]).click
    wait_for_css(input_elements[:change_tags])
    @page.find(input_elements[:change_tags]).click
  end

  def open_task_created(task_created)
  	tasks_list = get_entries
  	tasks_list.each do |task|
  	  return task.find(input_elements[:eye_button]).click if task.text.include?(task_created)
  	end
  	fail(ArgumentError.new("The task desired is not available"))
  end

  def verify_tag_present
  	return @page.has_content?(@tag_used)
  end

  def click_on_tag(tag = nil)
  	wait_for_css(input_elements[:stream_post])
  	@stream_post = @page.find(input_elements[:stream_post])
  	if tag
      tags_on_stream = @stream_post.all(input_elements[:tag_on_task_post])
      tags_on_stream.each do |tag_on_stream|
        return tag_on_stream.click if tag_on_stream.text.include?(tag)
      end
    else
      link = @stream_post.all(input_elements[:tag_on_task_post]).first
      link.click
      @link_text = link.text
    end
    fail(ArgumentError.new("Tag #{tag} not found on the stream post selected"))
  end

  def change_focus_to_new_window
    @main_page = @page.driver.browser.window_handles.first
    @popup_window = @page.driver.browser.window_handles.last
    @page.driver.browser.switch_to.window(@popup_window)
  end

  def get_tag_text
  	return @link_text
  end

  def check_tag_on_stream
    wait_for_css(input_elements[:entries_list])
    streams = get_entries
    streams.each do |stream|
      tags_on_stream = stream.all(input_elements[:tag_link_on_stream])
      fail(ArgumentError.new("Tag #{tag} not found on the stream posts")) unless check_for_tag_helper(tags_on_stream)
    end
    return true
  end

  def check_for_tag_helper(tags_on_stream)
    tags_on_stream.each do |tag_on_stream|
      return true if tag_on_stream.text.include?(@link_text)
    end
    return false
  end

end