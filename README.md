# Prev::Next

Index previous/next records in a recordset.

Takes an existing recordset such as ActiveRecord query and creates an index of previous/next records without extra database requests.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'prev-next', git: 'git://github.com/paul-at/prev-next'
```

And then execute:

    $ bundle

## Usage

Pass a recordset with records of any type with implemented id getter, such as ActiveRecord models, to Prev::Next.index method, which will return a hash with models indexed by previous/next values.

For example, an index for a query returning two Record models, one with id 1 and another with id 2 will be
```ruby
{
    1: {
        prev: nil,
        next: Record(2)
    },
    2: {
        prev: Record(2),
        next: nil
    }
}
```

See [test cases](test/prev/next_test.rb) for further details.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/paul-at/prev-next. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

