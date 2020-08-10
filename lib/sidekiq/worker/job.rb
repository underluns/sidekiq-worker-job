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

      # @param worker_name [String]
      # @param queue_name  [String]
      # @param id          [String]
      # @param args        [Array]
      # @param created_at  [Integer]
      # @param enqueued_at [Integer]
      def initialize(worker_name:, queue_name:, id:, args:, created_at:, enqueued_at:)
        @worker_name = worker_name
        @queue_name  = queue_name
        @id          = id
        @args        = args
        @created_at  = created_at
        @enqueued_at = enqueued_at
      end

      # @return [Sidekiq::Queue]
      def queue
        @queue ||= Sidekiq::Queue.new(*queue_name)
      end
    end
  end
end
