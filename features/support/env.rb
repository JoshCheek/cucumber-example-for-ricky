require 'rack/test'
require File.expand_path('../../app', __dir__)

module MyHelpers
  def app
    RailsEngine
  end
end

World(MyHelpers)
World(Rack::Test::Methods)
