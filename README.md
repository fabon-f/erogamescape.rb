# Erogamescape

ErogameScape (エロゲー批評空間) scraper

## Installation

TODO

<!-- TODO: Replace `UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG` with your gem name right after releasing it to RubyGems.org. Please do not do it earlier due to security reasons. Alternatively, replace this section with instructions to install your gem from git if you don't plan to release to RubyGems.org.

Install the gem and add to the application's Gemfile by executing:

    $ bundle add UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG -->

## Usage

```ruby
result = Erogamescape.query(<<SQL)
SELECT id, brandname, median
  FROM brandlist
  WHERE id = 1
SQL

result.size # 1
result.first # { "id" => "1", "brandname" => "âge(age)", "median" => "81" }
```

## Development

Run `bin/setup` to set up the project.

Some useful commands are available:

* `bundle exec rake test`: run the tests
* `bin/console`: an interactive prompt that will allow you to experiment

## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/fabon-f/erogamescape.rb>.

## License

[MIT License](https://opensource.org/licenses/MIT)
