
module ActionView
  class Base

  	def rich_cms
  	  render :file => File.join(File.dirname(__FILE__), "..", "..", "..", "..", "..", "app", "views", "rich_cms.html.erb") if session[:rich_cms].try(:fetch, :display, nil)
  	end

  	def link(name, options = nil)
  	  options = {:class => options || name.underscore} unless options.is_a?(Hash)
  	  link_to name, "#", options
  	end

    def render_with_rich_cms(*args, &block)
      ::Rich::Cms::Engine.current_controller = @controller
      render_without_rich_cms *args, &block
    ensure
      ::Rich::Cms::Engine.current_controller = nil
    end
    alias_method_chain :render, :rich_cms

  end
end