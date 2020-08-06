module Sidekiq
  module Worker
    class Job
      class ServerMiddleware
        # @param worker [Object] the worker instance.
        # @param job    [Hash]   the full job payload (https://github.com/mperham/sidekiq/wiki/Job-Format).
        # @param _queue [String] the name of the queue the job was pulled from.
        def call(worker, job, _queue)
          worker.job = Sidekiq::Worker::Job.new(job)
          yield
        end
      end
    end
  end
end
