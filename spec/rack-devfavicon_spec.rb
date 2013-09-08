
require 'rack'
require 'rack/test'
require 'rack-devfavicon'

describe Rack::DevFavicon do
  include Rack::Test::Methods

  let(:app) do
    Rack::Builder.new do
      use Rack::DevFavicon

      assets = File.expand_path("../assets", __FILE__)
      map '/favicon.ico' do
        run Rack::File.new("#{assets}/favicon.ico")
      end
      map '/favicon.png' do
        run Rack::File.new("#{assets}/favicon.png")
      end

      map '/orig_favicon.ico' do
        run Rack::File.new("#{assets}/favicon.ico")
      end
      map '/orig_favicon.png' do
        run Rack::File.new("#{assets}/favicon.png")
      end

      run lambda { |env| [200, "text/plain", ["Hello, Rack!"]] }
    end
  end

  it "modifies favicon.ico" do
    get '/orig_favicon.ico'
    orig = last_response.body

    get "/favicon.ico"

    expect(last_response.body).not_to eq(orig)
  end

  it "modifies favicon.png" do
    get '/orig_favicon.png'
    orig = last_response.body

    get "/favicon.png"

    expect(last_response.body).not_to eq(orig)
  end

end
