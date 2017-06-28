# Daimler

Mercedes–Benz /developers API client (see https://developer.mercedes-benz.com/home).

The ruby library supports the following Mercedes–Benz API's

- [ ] Image
- [ ] Dealer Locator (API endpoint not released)
- [ ] Car Configurator (API endpoint not released)
- [ ] Connected Vehicle (API endpoint not released)


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'daimler'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install daimler

## Usage

### Configuration

```ruby
# You can set configuration at class level like so
Daimler.configure do |c|
  c.api_key   = ENV['DAIMLER_API_KEY']
end

# Or configure each instance independently
@client = Daimler.new(
  :api_key   => ENV['DAIMLER_API_KEY'],
)
```

## Bug reports and other issues

* https://github.com/lmmendes/daimler/issues

## Help and Docs

* https://github.com/lmmendes/daimler/wiki

## Contributing

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a future version unintentionally.
* Send me a pull request. Bonus points for topic branches.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
