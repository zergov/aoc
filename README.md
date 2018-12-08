# Aoc
Advent of Code toolkit to fetch inputs and submit answers efficiently.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'aoc'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install aoc

## Usage

### bootstrap
You can bootstrap an advent of code challenge by using:
```
$ aoc bootstrap
```

This will create a directory containing today's challenge instructions, input file and a solution.rb file where you can start coding
your solution.

You can also bootstrap a challenge of an other day:
```
$ aoc bootstrap 15 2017
```

This will create a directory for day 15 of year 2017.


### fetch
You can also just output the challenge instruction using fetch:
```
$ aoc fetch
```

This will print today's challenge instructions.

You can also print the input of the challenge:
```
$ aoc fetch --input
```

Like bootstrap, you can also specifiy a challenge's day and year.
```
$ aoc fetch 5 2016
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/aoc.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
