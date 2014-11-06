require 'json'
require 'webrick'

class Flash
  def initialize(req)
    @req = req
    found_cookie = find_cookie
    @cookie = found_cookie  ? JSON.parse(found_cookie.value) : {}
    process_cookie
  end

  def process_cookie
    @cookie = {} if @cookie["_flag"]
  end

  def find_cookie
    @req.cookies.find { |cookie| cookie.name == "_rails_lite_flash" }
  end

  def [](key)
    @cookie[key]
  end

  def []=(key, val)
    @cookie[key] = val
    @cookie["_flag"] = true
  end

  def store_flash(res)
    res.cookies << WEBrick::Cookie.new("_rails_lite_flash", @cookie.to_json)
  end
end
