# EveryLog Ruby Client

A fantastic (and simple) gem to interact with the EveryLog API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'everylog_ruby_client'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install everylog_ruby_client

## Usage
```ruby
require 'everylog_ruby_client'

# @param [Hash] options
# @option options [String] :api_key for authenticate against EveryLog server
# @option options [String] :projectId name of the project
# @option options [String] :everylog_url (https://api.everylog.io/api/v1/log-entries) to reach Everlog server
$EveryLogClient = EveryLog::Client.instance.setup(api_key: <YOUR_API_KEY>, projectId: <YOUR_PROJECT_NAME>)

# @param [Hash] notify_options
# @option notify_options [String, options[:projectId]]  :projectId name of the project
# @option notify_options [String]  :title to display in the application and if enabled in the notification
# @option notify_options [String]  :summary is a not so long text to display on the application and if enabled in the notification
# @option notify_options [String]  :body it can contain a long text simple formatted, no html to display in the application
# @option notify_options [Array]   :tags it can be used to categorize the notification, must be strings
# @option notify_options [String]  :link it can be used to display on the application and if enabled in the notification
# @option notify_options [Boolean] :push if True, a push notification is sent to application
$EveryLogClient.notify(...)
```
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/everylogsaas/everylog_ruby_client. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/everylogsaas/everylog_ruby_client/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the EveryLog ruby client project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/everylogsaas/everylog_ruby_client/blob/master/CODE_OF_CONDUCT.md).
