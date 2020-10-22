require_relative 'lib/sidekiq/worker/job/version'

Gem::Specification.new do |spec|
  spec.name          = 'sidekiq-worker-job'
  spec.version       = Sidekiq::Worker::Job::VERSION
  spec.summary       = 'Attributes of sidekiq worker'
  spec.description   = 'Allows you to get job attributes inside the sidekiq worker'
  spec.authors       = ['Andrey Lun\'s']
  spec.email         = ['andxors@gmail.com']
  spec.homepage      = 'https://github.com/andxors/sidekiq-worker-job'
  spec.license       = 'MIT'

  spec.files         = Dir['lib/**/*.rb', 'bin/*', '[A-Z]*']
  spec.require_paths = ['lib']

  spec.required_ruby_version = '~> 2.7'
  spec.add_development_dependency 'bundler',       '~> 2.1'
  spec.add_development_dependency 'bundler-audit', '~> 0.7'
  spec.add_development_dependency 'rspec',         '~> 3.9'
  spec.add_development_dependency 'rubocops',      '~> 0.1'
  spec.add_development_dependency 'simplecov',     '~> 0.18'
  spec.add_runtime_dependency 'sidekiq', '~> 6.0'
end
