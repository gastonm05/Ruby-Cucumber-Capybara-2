class ExplorePage < BasePage
  def initialize(page)
    @page = page
    go_to_explore_page
  end

  def go_to_explore_page
    @page.visit(target_base_url + '/explore') if @page.current_path != '/explore'
  end

  def go_to_saved_searches_page
    @page.visit(target_base_url + '/explore/list') if @page.current_path != '/explore/list'
  end

  def search_keyword(keyword)
    @page.find('input[class="full-width horizontally-padded-inside-2"]').set(keyword)
  end

  def select_platform(platform)
    @page.find('a[class="select2-choice"]').click
    @page.find('input[role="combobox"]').set(platform)
    @page.find('li[class="select2-results-dept-0 select2-result select2-result-selectable select2-highlighted"]').click
  end

  def search_button
    @page.find('a[class="btn btn-primary left-spaced search-button"]').click
  end

  def save_button
    @page.find('a[class="btn btn-success left-spaced"]').click
  end

  def insert_name
    @name = Faker::Lorem.sentence
    @page.find('input[data-vh-id="value"]').set(@name)
    @page.find('a[data-action-id="action-2"]', text:"Continue").click
    @page.has_content?("Your search has been updated.")
    end

  def update_name
    @name_update = Faker::Lorem.sentence
    @page.find('input[data-vh-id="value"]').set(@name_update)
    @page.find('a[data-action-id="action-2"]', text:"Continue").click
    @page.has_content?("Your search has been saved.")
  end

  def search_present
    @page.find('h1[class="breadcrumb-step"]', text: @name)
  end

  def search_updated
    @page.find('h1[class="breadcrumb-step"]', text: @name_update)
  end

  def verify_results(keyword)
    wait_for_css('div[class="entry-header"]')
    results = @page.all('div[class="entry-body"]', text: keyword)
    results_number = results.size
    puts "#{results_number} results found as matching the keyword : #{keyword}"
  end

  def navigate_saved_searches
    @page.find('div[data-vh-id="sidebar-trigger"]').click
    @page.find('span[data-dropdown-target="@searches-submenu"]').click
    @page.find('li[class="menu-entry"]', text:@name).click
  end

  def manage_searches_page
    go_to_saved_searches_page
   # @page.find('div[data-vh-id="sidebar-trigger"]').click
   # @page.find('span[data-dropdown-target="@searches-submenu"]').click
   # @page.find('i[class="fa fa-edit"]').click
  end

  def delete_saved_searches
    wait_for_css('i[class="fa fa-chevron-down"]')
    saved_searches = @page.all('i[class="fa fa-chevron-down"]')
    saved_searches.each do |save_search|
      save_search.click
      @page.find('a[data-vh-id="delete"]').click
      @page.find('a[data-action-id="action-2"]').click
    end
  end

  def twitter_user_check(twitter_user)
    wait_for_css('div[class="entry-header"]')
    results = @page.all('div[class="entry-body"]', text: twitter_user)
    results_number = results.size
    puts "#{results_number} Twitter users found matching : #{twitter_user}"
  end


  def comment_first_post
    wait_for_css('a[data-action-handler="reply"]')
    @page.first('a[data-action-handler="reply"]').click
  end

  def select_account(account)
    @page.find('div[data-vh-id="accounts-list-container"]').click
    @page.find('li[data-searchable-label=' + '"' + account + '"' + ']').click
    @page.find('a[data-vh-id="close-panel"]').click
  end

  def comment(comment_text)
    #wait_for_css('div[data-vh-id="message-area"]')
    @page.find('div[data-vh-id="message-area"]').click
    @page.find('div[data-vh-id="message-area"]').set(comment_text)
    #wait_for_css('a[class="btn btn-lg btn-success"]')
    @page.find('a[class="btn btn-lg btn-success"]').click
    @page.has_content?("Your message will be sent in a few moments.")
  end

  def delete_comment(comment_to_delete)
    wait_for_css('a[data-action-handler="reply"]')
    comment_links = get_comments_links
    comment_links[0..5].each do |comment_link|
      puts 'Checking comment/s of Post'
      comment_link.click
      comments_content = get_comments_content
      comments_content.each do |comment_content|
        if comment_content.text.include?(comment_to_delete)
          @page.within(comment_content) do
        @page.find('a[data-action-handler="remove-comment"]').click
        end
        confirm_remove
        puts "1 comment deleted"
    else puts"The content of the comment checked does not match the : #{comment_to_delete}"
      end
    end
    end
    puts "All comments were checked"
  end

  def verify_comment_remove(comment_to_verify)
    wait_for_css('a[data-action-handler="reply"]')
    comment_links = get_comments_links
    comment_links[0..10].each do |comment_link|
      puts 'Checking comment/s of Post'
      comment_link.click
      comments_content = get_comments_content
      comments_content.each do |comment_content|
        if comment_content.text.include?(comment_to_verify) do
          fail(ArgumentError.new("Verification Failed: 1 Comment found matching the argument: #{comment_to_verify}"))
        end
        end
      end
    end
    puts "Verification Completed"
    end

  def confirm_remove
    @page.find('a[class="btn btn-lg btn-danger"]').click
    @page.has_content?("Your comment has been deleted.")
  end

  def get_comments_links
    @page.all('a[data-action-handler="toggle-comments"]')
  end

    def get_comments_content
      @page.all('div[data-post-hierachy="comment"]')
    end
end
