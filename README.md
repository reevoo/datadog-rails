# Datadog Rails

Collects basic performance metrics for a Rails application and sends them to [Datadog](https://www.datadoghq.com) platform.

Inspired by https://github.com/metova/datadoge. Thanks guys.

## Installation

Install the [Datadog Agent](https://app.datadoghq.com/account/settings#agent) on your application server. This gem only
works on servers which have the Datadog Agent installed.

Add this line to your application's Gemfile:

    gem 'datadog-rails'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install datadog-rails

## Usage

Datadog Rails track your controller actions automatically. If you want to change the default config please create
an initializer:

    Datadog::Rails.configure do |config|
      config.app_name = 'awesome_app'                   # default is ::Rails.application.class.parent_name
      config.metric_prefix = 'awesome_app.performance'  # default is 'rails.performance'
      config.environments = %w(production staging)      # default is ['production']
    end

## Contributing

1. Fork it ( https://github.com/reevoo/datadog-rails )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
