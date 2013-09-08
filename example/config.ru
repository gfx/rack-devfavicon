require 'rack'

require 'rack-devfavicon'

class HelloWorld
  def self.call(env)
    [200, {"Content-Type" => "text/html"}, ["<p>Hello Rack!</p>"]]
  end
end

use Rack::DevFavicon

assets = File.expand_path("../../spec/assets", __FILE__)

map "/favicon.png" do
    run Rack::File.new("#{assets}/favicon.png")
end

map "/favicon.ico" do
    run Rack::File.new("#{assets}/favicon.ico")
end

run HelloWorld
