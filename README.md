# cli-format

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cli-format'
```

And then execute:

    $ bundle

## Usage

```ruby
require "cli-format"

options = {header: true, format: "table"}
header = ["Name", "Food", "Color"]
data = [
  ["Tung", "Apple", "Yellow"],
  ["Bob", "Pear", "Blue"],
]

presenter = CliFormat::Presenter.new(options)
presenter.header = header
data.each do |row|
  presenter.rows << row
end
presenter.show
```

Format table shows:

    +------+-------+--------+
    | Name | Food  | Color  |
    +------+-------+--------+
    | Tung | Apple | Yellow |
    | Bob  | Pear  | Blue   |
    +------+-------+--------+

Format csv shows:

    Name,Food,Color
    Tung,Apple,Yellow
    Bob,Pear,Blue

Format json shows:

```json
{
  "header": [
    "Name",
    "Food",
    "Color"
  ],
  "data": [
    [
      "Tung",
      "Apple",
      "Yellow"
    ],
    [
      "Bob",
      "Pear",
      "Blue"
    ]
  ]
}
```

## Thor CLI Options

To expose the format in Thor CLI options, you can use `CliFormat.formats`. Example:

```ruby
option :format, desc: "Output formats: #{CliFormat.formats.join(', ')}"
```

## Text

If you would like to grab just the text and not it shown, use the `text` method.

```ruby
presenter.text
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/cli_format.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
