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
      # @attr_reader created_at  [Float]
      # @attr_reader enqueued_at [Float]
      attr_reader :worker_name, :queue_name, :id, :args, :created_at, :enqueued_at

      class << self
        # @param attributes [Hash] the full job payload (https://github.com/mperham/sidekiq/wiki/Job-Format).
        # @return [Sidekiq::Worker::Job]
        def new_from_payload(attributes)
          new(
            worker_name: attributes.fetch('class'),
            queue_name:  attributes.fetch('queue'),
            id:          attributes.fetch('jid'),
            args:        attributes.fetch('args'),
            created_at:  attributes.fetch('created_at'),
            enqueued_at: attributes.fetch('enqueued_at', nil)
          )
        end

        # @return [Array<Sidekiq::Worker::Job>] an array of jobs in queues.
        def list_from_queues
          Sidekiq::Queue.all.map(&:to_a).flatten.map(&:item).map(&method(:new_from_payload))
        end

        # @return [Array<Sidekiq::Worker::Job>] an array of jobs in workers.
        def list_from_workers
          Sidekiq::Workers.new.to_a.map(&:last).map(&OpenStruct.method(:new)).map(&:payload).map(&method(:new_from_payload))
        end
      end

      # @param worker_name [String]
      # @param queue_name  [String]
      # @param id          [String]
      # @param args        [Array]
      # @param created_at  [Float]
      # @param enqueued_at [Float]
      def initialize(worker_name: nil, queue_name: nil, id: nil, args: nil, created_at: nil, enqueued_at: nil)
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
