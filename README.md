# AppReset

## Installation

It is recommended you only include `app_reset` in your development environment:

```ruby
gem 'app_reset', :group => :development
```

If you are using it in a rails engine, don't forget to require it:

```ruby
require 'app_reset' if Rails.env.development?
```

## Usage

Resets (and if available, seeds) your development and test databases via:

    rake app:reset

## License

This gem is released under the [MIT License](http://www.opensource.org/licenses/mit-license.php).

## Author

[Fred Wu](https://github.com/fredwu)
