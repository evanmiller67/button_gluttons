module ApplicationHelper
  # Make it easy to set a page title
  def title(page_title)
    content_for(:title) { page_title }
  end

  # Build the HTML to display flash messages
  def build_flash
    result = ""
    flash.each do |type, message|
      type = case type
        when :alert   then :error
        when :notice  then :success
        else :error
      end
      result << "<div class='alert alert-#{type} fade in out' id='flash'><a href='#' class='close' data-dismiss='alert'>x</a>#{message}</div>"
    end

    return result
  end
end