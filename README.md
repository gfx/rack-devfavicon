# Rack::DevFavicon

The Rack::DevFavicon middleware shows the favicon in gray scale on a specified environment

## Installation

Add this line to your application's Gemfile:

    gem 'rack-devfavicon'

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install rack-devfavicon

## Usage

```ruby
if Rails.env? != 'producction'
    require 'rack-devfavicon'
    use Rack::Devfavicon
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
