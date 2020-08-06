module Sidekiq
  module Worker
    class Job
      module Extension
        # @attr_accessor job [Sidekiq::Worker::Job]
        attr_accessor :job
      end
    end
  end
end
