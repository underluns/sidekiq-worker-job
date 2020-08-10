module Sidekiq
  module Worker
    class Job
      class ServerMiddleware
        # @param worker [Object] the worker instance.
        # @param job    [Hash]   the full job payload (https://github.com/mperham/sidekiq/wiki/Job-Format).
        # @param _queue [String] the name of the queue the job was pulled from.
        def call(worker, job, _queue)
          worker.job = Sidekiq::Worker::Job.new(
            worker_name: job.fetch('class'),
            queue_name:  job.fetch('queue'),
            id:          job.fetch('jid'),
            args:        job.fetch('args'),
            created_at:  job.fetch('created_at'),
            enqueued_at: job.fetch('enqueued_at')
          )

          yield
        end
      end
    end
  end
end
