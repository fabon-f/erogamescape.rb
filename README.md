# Erogamescape

ErogameScape (エロゲー批評空間) scraper

## Installation

    $ bundle add erogamescape

Or install globally:

    $ gem install erogamescape

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
