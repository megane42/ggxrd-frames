# GGXrd::Frames

This gem scrapes GGXrd official frame data page (http://www.4gamer.net/guide/ggxrd/) and gives you the result as a hash.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ggxrd-frames'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ggxrd-frames

## Usage

```ruby
require 'ggxrd/frames'

pp GGXrd::Frames::frame_of('SO')[25]

## ==>
##   {"name"=>"ヴォルカニックヴァイパー（HS）",
##    "damage"=>"40・25",
##    "tension"=>"300 / 480・720",
##    "attack_lv"=>"2",
##    "risc_lv"=>"-7 / +10",
##    "prorate"=>"―",
##    "attribute"=>"上",
##    "startup"=>"5",
##    "active"=>"2（3）18",
##    "recovery"=>"29＋着地後8",
##    "frame_adv"=>"- 41",
##    "invincibility"=>"1〜6無，7〜11打，7〜空",
##    "remarks"=>""}
```

The argumet is the abbrev. of each character name. You can confirm all names by:

```ruby
pp GGXrd::Frames::CHARACTERS.keys

## ==> 
##   ["SO",
##    "SO_DI",
##    "KY",
##    "MA",
##    "MI",
##    "ZT",
##    "PO",
##    ...]
```

## Caveat

The result is written in Japanese because the official site is written in Japanese.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/ggxrd-frames/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
