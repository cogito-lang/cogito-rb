# cogito-rb

[![Build Status](https://github.com/cogito-lang/cogito-rb/workflows/Main/badge.svg)](https://github.com/cogito-lang/cogito-rb/actions)
[![Gem Version](https://img.shields.io/gem/v/cogito.svg)](https://rubygems.org/gems/cogito)

A small ruby library that wraps [libcogito](https://github.com/cogito-lang/libcogito).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cogito'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cogito

## Usage

```ruby
irb(main):001:0> puts Cogito.to_json('ALLOW a ON b;')
[
  {
    "Effect": "Allow",
    "Action": [
      "a"
    ],
    "Resource": [
      "b"
    ]
  }
]

irb(main):002:0> puts Cogito.to_iam(['Effect' => 'Allow', 'Action' => 'a', 'Resource' => 'b'].to_json)
ALLOW
  a
ON
  b;
```

## Development

After checking out the repo, run `bundle/install` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cogito-lang/cogito-rb.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
