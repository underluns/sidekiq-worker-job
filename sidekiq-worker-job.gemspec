require_relative 'lib/sidekiq/worker/job/version'

Gem::Specification.new do |spec|
  spec.name          = 'sidekiq-worker-job'
  spec.version       = Sidekiq::Worker::Job::VERSION
  spec.summary       = 'Attributes of sidekiq worker'
  spec.description   = 'Allows you to get job attributes inside the sidekiq worker'
  spec.authors       = ['Andrey Lun\'s']
  spec.email         = ['underluns@gmail.com']
  spec.homepage      = 'https://github.com/underluns/sidekiq-worker-job'
  spec.license       = 'MIT'

  spec.files         = Dir['lib/**/*.rb', 'bin/*', '[A-Z]*']
  spec.require_paths = ['lib']

  spec.required_ruby_version = '~> 2.7'
  spec.add_development_dependency 'bundler',             '~> 2.2'
  spec.add_development_dependency 'bundler-audit',       '~> 0.7'
  spec.add_development_dependency 'rspec',               '~> 3.10'
  spec.add_development_dependency 'rubocop',             '~> 1.6'
  spec.add_development_dependency 'rubocop-performance', '~> 1.9'
  spec.add_development_dependency 'rubocop-rspec',       '~> 2.0'
  spec.add_development_dependency 'simplecov',           '~> 0.20'
  spec.add_runtime_dependency 'sidekiq', '~> 6.0'
end
