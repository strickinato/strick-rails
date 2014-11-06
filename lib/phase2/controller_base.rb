module Phase2
  class ControllerBase
    attr_reader :req, :res

    # Setup the controller
    def initialize(req, res)
      @req = req
      @res = res
      @already_built_response = false
    end

    # Helper method to alias @already_built_response
    def already_built_response?
      @already_built_response
    end

    # Set the response status code and header
    def redirect_to(url)
      self.res.status = 302
      self.res.header["location"] = url
      if already_built_response?
        raise "already built response"
      else
        @already_built_response = true
      end
    end

    # Populate the response with content.
    # Set the response's content type to the given type.
    # Raise an error if the developer tries to double render.
    def render_content(content, type)
      self.res.body = content
      self.res.content_type = type
      if already_built_response?
        raise "already built response"
      else
        @already_built_response = true
      end
    end
  end
end
