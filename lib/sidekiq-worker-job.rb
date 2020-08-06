require 'sidekiq'
require 'sidekiq/worker/job'

module Sidekiq
  module Worker
    include Sidekiq::Worker::Job::Extension
  end
end

Sidekiq.server_middleware do |chain|
  chain.add Sidekiq::Worker::Job::ServerMiddleware
end
