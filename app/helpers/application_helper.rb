module ApplicationHelper
  # Make it easy to set a page title
  def title(page_title)
    content_for(:title) { page_title }
  end

  # Build the Javascript to display flash messages
  def build_flash
    result = ""
    flash.each do |type, message|
      type = case type
        when :alert   then :error
        when :notice  then :success
        else :info
      end
      result << "humane.#{type}('#{message}'); "
    end

    return result
  end
end