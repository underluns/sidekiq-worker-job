# Sidekiq::Worker::Job
Allows you to get [job attributes](https://github.com/mperham/sidekiq/wiki/Job-Format) inside the worker.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sidekiq-worker-job'
```

And then execute:

    bundle install

Or install it yourself as:

    gem install sidekiq-worker-job

## Usage

To access the [job attributes](https://github.com/mperham/sidekiq/wiki/Job-Format), it is enough to call the corresponding methods.

```ruby
class MyWorker
  include Sidekiq::Worker
  
  def perform
    job      # => Sidekiq::Job
    job.item # => Hash (https://github.com/mperham/sidekiq/wiki/Job-Format)
  end
end
```

## Development and Testing

To start the interactive development console, use the command:

    make console

To test the proper performance of the code, use [rspec](https://rubygems.org/gems/rspec).

    make rspec

To check the coding style, use [rubocop](https://rubygems.org/gems/rubocop).

    make rubocop

To check the security of the code, use [bundle-audit](https://rubygems.org/gems/bundle-audit).
    
    make audit

To check code coverage by tests, use [simplecov](https://rubygems.org/gems/simplecov). The result of her work can be viewed in `coverage/index.html`.

All checks are run with the following command:

    make check

## Contributing

Bug reports and pull requests are welcome on [GitHub](https://github.com/andxors/sidekiq-worker-job).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
