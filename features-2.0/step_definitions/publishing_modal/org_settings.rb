class OrgSettings < BasePage
  def initialize(page, _url = nil)
    @page = page
    @chain_name = nil
  end

  def account_setting(account)
    wait_for_css(input_elements[:settings_dropdown_options])
    options = @page.all(input_elements[:settings_dropdown_options])
    options.each do |option|
      return option.click if option.text.include?(account)
    end
    fail(ArgumentError.new("Can't find the '#{account}' Setting option on the menu"))
  end

  def authorizations
    wait_for_css(input_elements[:authorizations])
    @page.find(input_elements[:authorizations]).click
  end

  def approval_chains
    wait_for_css(input_elements[:approval_chains_option])
    @page.find(input_elements[:approval_chains_option]).click
  end

  def members
    wait_for_css(input_elements[:members_option])
    @page.find(input_elements[:members_option]).click
  end

  def change_role(role_to_pick)
    wait_for_css(input_elements[:members_role_select])
    @page.find(input_elements[:members_role_select]).click
    select_role(role_to_pick.capitalize)
  end

  def select_role(role_to_pick)
    wait_for_css(input_elements[:role_dropdown_options])
    options = @page.all(input_elements[:role_dropdown_options])
    options.each do |option|
      return option.click if option.text.include?(role_to_pick)
    end
    fail(ArgumentError.new("Can't find the '#{role_to_pick}' Role option on the menu"))
  end

  def add_approval_chain
    @page.find(input_elements[:add_approval_chain]).click
  end

  def delete_chain(chain_name)
    wait_for_css(input_elements[:approval_chains_list])
    approval_chains_list = @page.all(input_elements[:approval_chains_list])
    approval_chains_list.each do |approval_chain|
      next unless approval_chain.text.include?(chain_name)
      delete_link = approval_chain.find(input_elements[:approval_chain_delete])
      delete_link.click
      return @page.find(input_elements[:continue_danger]).click
    end
    fail(ArgumentError.new("Can't find the '#{chain_name}' on the Approval Chains List"))
  end

  def click_on_permission_link(permission)
    wait_for_css(input_elements[:permissions_links])
    links = @page.all(input_elements[:permissions_links])
    links.each do |link|
      return link.click if link.text.eql?(permission)
    end
    fail(ArgumentError.new("Can't find the '#{permission}' Link on the Permissions list"))
  end

  def click_on_permission_option(option)
    wait_for_css(input_elements[:permissions_options])
    options = @page.all(input_elements[:permissions_options])
    options.each do |opt|
      if opt.text.eql?(option.capitalize)
        opt.click unless opt[:class].include?('selected')
        return true
      end
    end
    fail(ArgumentError.new("Can't find the '#{option}' Option on the Permissions Options list"))
  end

  def remove_permission_option(option)
    wait_for_css(input_elements[:permissions_options])
    options = @page.all(input_elements[:permissions_options])
    options.each do |opt|
      if opt.text.eql?(option.capitalize)
        opt.click if opt[:class].include?('selected')
        return true
      end
    end
    fail(ArgumentError.new("Can't find the '#{option}' Option on the Permissions Options list"))
  end

  def is_selected?(option)
    options = @page.all(input_elements[:permissions_options])
    options.each do |opt|
      if opt.text.eql?(option.capitalize)
        return opt[:class].include?('selected')
      end
    end
    fail(ArgumentError.new("Can't find the '#{option}' Option on the Permissions Options list"))
  end

  def click_update_button
    @page.find(input_elements[:update_button]).click
  end

  def click_update_approval_chain_button
    @page.find(input_elements[:approval_chain_update_button]).click
  end

  def warning_message_present?
    @page.find(input_elements[:warning_message]).text.include?('you cannot change the list of the approvers')
  end

  def pick_approver(user_to_pick)
    wait_for_css(input_elements[:approval_chain_approver_options])
    users = @page.all(input_elements[:approval_chain_approver_options])
    users.each do |user|
      next unless user.text.include?(user_to_pick)
      if user[:class].include?('readonly')
        return false
      else
        return user.click
              end
    end
    fail(ArgumentError.new("Can't find the '#{user_to_pick}' User on the Users Options"))
  end

  def set_chain_name(name)
    @chain_name = name
    @page.find(input_elements[:approval_chain_name_field]).set(name)
    puts "name used: #{@chain_name}"
  end

  def get_chain_name
    @chain_name
  end

  def save_approval_chain
    wait_for_css(input_elements[:approval_chain_save_button])
    @page.find(input_elements[:approval_chain_save_button]).click
    sleep(5)
  end

  def click_button(option)
    case option.downcase
    when 'update'
      click_update_button
    when 'update pproval chain'
      click_update_approval_chain_button
    when 'save approval chain'
      save_approval_chain
    end
  end

  def edit_chain(chain_name)
    wait_for_css(input_elements[:approval_chains_list])
    approval_chains_list = @page.all(input_elements[:approval_chains_list])
    approval_chains_list.each do |approval_chain|
      if approval_chain.text.include?(chain_name)
        approval_link = approval_chain.find(input_elements[:approval_chain_link])
        return approval_link.click
      end
    end
    fail(ArgumentError.new("Can't find the '#{chain_name}' Chain on the Approval Chains List"))
  end

  def is_button_present_on_chain?(button, chain_name)
    wait_for_css(input_elements[:approval_chains_list])
    approval_chains_list = @page.all(input_elements[:approval_chains_list])
    approval_chains_list.each do |approval_chain|
      next unless approval_chain.text.include?(chain_name)
      case button
      when 'edit'
        return approval_chain.has_css?(input_elements[:approval_chain_edit])
      when 'delete'
        return approval_chain.has_css?(input_elements[:approval_chain_delete])
              end
      fail(ArgumentError.new("Can't find the '#{button}' on the Approval Chain Buttons List"))
    end
    fail(ArgumentError.new("Can't find the '#{chain_name}' Chain on the Approval Chains List"))
  end

  def click_continue_danger
    @page.find(input_elements[:continue_danger]).click
  end

  def click_continue_primary
    @page.find(input_elements[:continue_primary]).click
  end

  def is_button_for_user?(button, user, option)
    interact_button_and_user(button, user, option)
  end

  def interact_button_and_user(button, user, option)
    wait_for_css(input_elements[:members_list_items])
    members_list = @page.all(input_elements[:members_list_items])
    members_list.each do |member|
      puts "Text: #{member.text}"
      next unless member.text.include?(user.capitalize)
      case button
      when 'edit'
        button_element = member.find(input_elements[:member_edit_role])
      when 'delete'
        button_element = member.find(input_elements[:member_delete])
      else
        fail(ArgumentError.new("Can't find the '#{button}' on the Users Buttons"))
              end
      case option
      when 'disabled'
        return true if button_element['data-vh-disabled']
      when 'click'
        return button_element.click
      else
        return true
      end
      return false
    end
    fail(ArgumentError.new("Can't find the '#{user}' on the Users List"))
  end

  def click_button_for_user(button, user, option)
    interact_button_and_user(button, user, option)
  end

  def is_error_present?
    error_text = @page.find(input_elements[:error_message]).text
    !error_text.nil?
  end

  def set_chain_as_default(chain_name)
    search_chain(chain_name, 'mark_default')
  end

  def remove_chain_as_default(chain_name)
    search_chain(chain_name, 'unmark_default')
  end

  def search_chain(chain_name, action)
    wait_for_css(input_elements[:approval_chains_list])
    approval_chains_list = @page.all(input_elements[:approval_chains_list])
    approval_chains_list.each do |approval_chain|
      next unless approval_chain.text.include?(chain_name)
      case action
      when 'click'
        return approval_chain.find(input_elements[:approval_chain_link]).click
      when 'mark_default'
        if approval_chain.has_css?(input_elements[:approval_chain_set_default])
          approval_chain.find(input_elements[:approval_chain_set_default]).click
        end
        return true
      when 'unmark_default'
        return approval_chain.find(input_elements[:approval_chain_remove_default]).click
              end
    end
    fail(ArgumentError.new("Can't find the '#{chain_name}' Chain on the Approval Chains List"))
  end

  ################################
  #
  # Publishing Campaign
  #
  ################################

  def campaigns
    wait_for_css(input_elements[:campaigns])
    @page.find(input_elements[:campaigns]).click
  end

  def add_publishing_campaign
    wait_for_css(input_elements[:add_publishing_campaign])
    @page.find(input_elements[:add_publishing_campaign]).click
  end

  def select_google_analytics
    wait_for_css(input_elements[:tracking_google_analytics])
    @page.find(input_elements[:tracking_google_analytics]).click
  end

  def add_tracking_parameters
    # Nothing changed for now
  end

  def set_campaign_name(name)
    @page.find(input_elements[:name_publishing_campaign]).set(name)
  end

  def save_publishing_campaign
    @page.find(input_elements[:save_campaign], text: 'Save').click
  end

  def delete_campaign(campaign_name)
    campaign_id = @page.find(input_elements[:campaign_item], text: "#{campaign_name}")['data-publishing-campaign-id']
    @page.find(input_elements[:delete_campaign].replace_key(campaign_id)).click
    @page.find(input_elements[:continue], text: 'Continue').click
  end

  ################################
  #
  # Organization General
  #
  ################################
  def general
    @page.find(input_elements[:organization_general]).click
  end

  def update
    @page.find(input_elements[:update]).click
  end

  def check_campaign_tracking
    @page.check(input_elements[:always_campaign])
    update
  end

  def uncheck_campaign_tracking
    @page.uncheck(input_elements[:always_campaign])
    update
  end

  def check_campaign(campaign_name)
    @page.find(input_elements[:campaign_item], text: "#{campaign_name}")
  end
end
