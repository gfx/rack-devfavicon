
require 'rack-devfavicon/version'
require 'rack'
require 'rmagick'

module Rack
  class DevFavicon
    def initialize(app, options = {})
      @app = app
    end

    def call(env)
      unless env['PATH_INFO'] =~ %r{\A /favicon\.(?:png|ico) \z}xm
        return @app.call(env)
      end

      env.delete('HTTP_IF_MODIFIED_SINCE') # do not cache the icon file

      status, headers, response = @app.call(env)

      data = ''
      response.each do |buf|
        data << buf
      end

      img = Magick::Image.from_blob(data) do |info|
        info.format = headers['Content-Type'] =~ /png/ ? 'PNG' : 'ICO'
      end[0]
      img = img.quantize(4, Magick::GRAYColorspace)

      [status, headers, [img.to_blob]]
    end
  end
end
