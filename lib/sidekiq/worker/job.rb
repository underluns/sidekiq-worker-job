require 'sidekiq/worker/job/version'
require 'sidekiq/worker/job/extension'
require 'sidekiq/worker/job/server_middleware'

module Sidekiq
  module Worker
    class Job
      # @attr_reader worker_name [String]
      # @attr_reader queue_name  [String]
      # @attr_reader id          [String]
      # @attr_reader args        [Array]
      # @attr_reader created_at  [Integer]
      # @attr_reader enqueued_at [Integer]
      attr_reader :worker_name, :queue_name, :id, :args, :created_at, :enqueued_at

      # @param attributes [Hash] the full job payload (https://github.com/mperham/sidekiq/wiki/Job-Format).
      def initialize(attributes)
        @worker_name = attributes.fetch('class')
        @queue_name  = attributes.fetch('queue')
        @id          = attributes.fetch('jid')
        @args        = attributes.fetch('args')
        @created_at  = attributes.fetch('created_at')
        @enqueued_at = attributes.fetch('enqueued_at')
      end
    end
  end
end
