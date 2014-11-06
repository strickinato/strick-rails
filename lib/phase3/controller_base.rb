require_relative '../phase2/controller_base'
require 'active_support/core_ext'
require 'erb'

module Phase3
  class ControllerBase < Phase2::ControllerBase
    # use ERB and binding to evaluate templates
    # pass the rendered html to render_content
    def render(template_name)
      filename = "views/#{self.class.to_s.underscore}/#{template_name}.html.erb"

      f = File.read(filename)
      b = binding()
      
      template = ERB.new(f).result(b)

      render_content(template, "text/html")
    end
  end
end
