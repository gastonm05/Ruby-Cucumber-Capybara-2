class StreamPage < BasePage
  attr_reader :account, :mention, :platform

  def initialize(page)
    @page = page
    @page.visit(target_base_url + '/stream') if @page.current_path != '/stream'
  end

  def platform=(value)
    @platform = value
    @page.click_link('Change filters')
    @page.find("a[data-target=\"#filter-mentions-#{@platform}\"]").click
  end

  def account=(value)
    @account = value
    @page.find("#filter-mentions-#{@platform} li[data-searchable-label=\"#{@account}\"]").click
  end

  attr_writer :mention

  def apply_filter
    @page.find("a[data-vh-id='filters-preview']").click
  end

  def has_mention?
    @page.has_content?(@mention)
  end
end
