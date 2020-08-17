module Sidekiq
  module Worker
    module Job
      class ServerMiddleware
        # @param worker [Object] the worker instance.
        # @param job    [Hash]   the full job payload (https://github.com/mperham/sidekiq/wiki/Job-Format).
        # @param queue  [String] the name of the queue the job was pulled from.
        def call(worker, job, queue)
          worker.job = Sidekiq::Job.new(job, queue)

          yield
        end
      end
    end
  end
end
