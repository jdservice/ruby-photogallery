module ApplicationHelper

  def menu_link_to(*args, &block)
    url = args[1]
    mapping = Rails.application.routes.recognize_path(url)
    
    class_property = "menu_selected" if mapping[:controller] == controller.controller_path
    content_tag :li, :class => class_property do
      link_to *args, &block
    end
  end

end
