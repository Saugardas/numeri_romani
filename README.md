# NumeriRomani

Numeri Romani (*lat. roman numerals*) - simple library for conversion integers to roman numerals and roman numerals to integers.
Convert numbers within range of [1/12 .. 3_999_999(11/12)].

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
NumeriRomani.to_roman(125_202) # => 'C̅X̅X̅V̅CCII'
NumeriRomani.to_roman(-1) # => ArgumentError: Number should be in interval [1..3_999_999]
NumeriRomani.to_roman(10**7) # => ArgumentError: Number should be in interval [1..3_999_999]
```
```ruby
NumeriRomani.to_decimal('DXXI') # => 521
NumeriRomani.to_decimal('M̅M̅C̅C̅C̅X̅L̅V̅DCLXXVIII') # => 2_345_678
NumeriRomani.to_decimal('IIIXC') # => ArgumentError: Not valid roman number
````
Fractions:

| Roman numeral|Fraction  |
|:------------:| :-------:|
| S            |6/12 (1/2)|
| ⁙ (*****)    |      5/12|
| ∷ (****)     |4/12 (1/3)|
| ∴ (***)      |3/12 (1/4)|
| ∶ (**)       |2/12(1/6) |
| ⋅ (*)        |      1/12|

```ruby
NumeriRomani.to_decimal('IS') # => (3/2)
NumeriRomani.to_decimal('S⁙') # => (11/12)
NumeriRomani.to_decimal('S*****') # => (11/12)
```

```ruby
NumeriRomani.to_roman(3/4r) # => 'S∴'
NumeriRomani.to_roman(5.5) # => 'VS'
NumeriRomani.to_roman(10.11) # => 'X⋅' (0.11 ~ 1/12)
NumeriRomani.to_roman(10.13) # => 'X∶' (0.13 ~ 2/12)
NumeriRomani.to_roman(12.77) # => 'XIIS∷' (0.77 ~ 10/12)
```

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

* **Add Apostrophus system for big numbers.** For instance: CCC|ƆƆƆ|ƆƆƆ (C̅X̅X̅MMMCXXIII)

* **Add Validation module**.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

