module Sidekiq
  module Worker
    module Job
      module Extension
        # @attr_accessor job [Sidekiq::Job]
        attr_accessor :job
      end
    end
  end
end
