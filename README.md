# ExecIf

This gem adds `exec_if` method to `Object` class.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'exec_if'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install exec_if

## Usage

```ruby
require 'exec_if'

[1, 2, 3, 4, 5].map do |i|
  i.exec_if(i.even?) {|even| 'even' }
end # => [1, 'even', 3, 'even', 5]
```

It is especially useful for long method chains.

```ruby
Item.active.
  exec_if(params[:published_to].presence) {|item, published_to| item.where(published_at: nil..published_to) }.
  exec_if(params[:name].presence) {|item, name| item.where("name LIKE ?", "%#{name}%")}.
  order(published_at: :desc)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/exec_if. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ExecIf project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/exec_if/blob/master/CODE_OF_CONDUCT.md).
