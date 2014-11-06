require_relative '../phase3/controller_base'
require_relative './session'
require_relative '../bonus/flash'

module Phase4
  class ControllerBase < Phase3::ControllerBase
    def redirect_to(url)
      super
      session.store_session(@res)
      flash.store_flash(@res)
    end

    def render_content(content, type)
      super
      session.store_session(@res)
      flash.store_flash(@res)
    end

    # method exposing a `Session` object
    def session
      @session ||= Session.new req
    end

    def flash
      @flash ||= Flash.new req
    end
  end
end
