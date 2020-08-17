require 'sidekiq/worker/job/version'
require 'sidekiq/worker/job/extension'
require 'sidekiq/worker/job/server_middleware'

module Sidekiq
  module Worker
    module Job
      class << self
        # @param attributes [Hash] the full job payload (https://github.com/mperham/sidekiq/wiki/Job-Format).
        # @return [Sidekiq::Job]
        def new_from_payload(attributes)
          Sidekiq::Job.new(attributes)
        end

        # @return [Array<Sidekiq::Job>] an array of jobs in queues.
        def list_from_queues
          Sidekiq::Queue.all.map(&:to_a).flatten.map(&:item).map(&method(:new_from_payload))
        end

        # @return [Array<Sidekiq::Job>] an array of jobs in workers.
        def list_from_workers
          Sidekiq::Workers.new.to_a.map(&:last).map(&OpenStruct.method(:new)).map(&:payload).map(&method(:new_from_payload))
        end
      end
    end
  end
end
