# NumeriRomani

Numeri Romani (lat. roman numerals) - simple library for conversion integers to roman numerals and roman numerals to integers.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'numeri_romani'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install numeri_romani

## Usage
```ruby
NumeriRomani.to_roman(521) # => 'DXXI'
NumeriRomani.to_decimal('DXXI') # => 521
````

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

 1) Fork it
 2) Create your feature branch (git checkout -b my-new-feature)
 3) Commit your changes (git commit -am 'Add some feature')
 4) Push to the branch (git push origin my-new-feature)
 5) Create a new Pull Request

Contributions are welcome!

Here's some ideas (maybe also a roadmap for possible future versions of the library):

* **Extend for big numbers.** Using Apostrophus/Vinculum system.(For instance: CCC|ƆƆƆ|ƆƆƆ, C̅X̅X̅I̅I̅I̅CXXIII)

* **Extend for fractions**. For example S: - 2/3, S:·: - 11/12

* **Add Validation module**.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

