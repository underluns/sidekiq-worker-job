describe Sidekiq::Worker::Job::ServerMiddleware do
  let(:middleware) { described_class.new }

  describe '#call' do
    let(:worker) do
      Class.new { include Sidekiq::Worker }.new
    end

    let(:queue) { 'queue' }
    let(:job) do
      {
        'class'       => 'SomeWorker',
        'queue'       => queue,
        'jid'         => 'b4a577edbccf1d805744efa9',
        'args'        => [1, 'arg', true],
        'created_at'  => 1234567890,
        'enqueued_at' => 1234567891
      }
    end

    it 'sets the job parameter' do
      middleware.call(worker, job, queue) { nil }

      expect(worker.job).to be_instance_of(Sidekiq::Job)
    end

    it 'sets attributes to the job' do
      middleware.call(worker, job, queue) { nil }

      expect(worker.job).to have_attributes(
        klass:       'SomeWorker',
        queue:       'queue',
        jid:         'b4a577edbccf1d805744efa9',
        args:        [1, 'arg', true],
        created_at:  Time.at(1234567890).utc,
        enqueued_at: Time.at(1234567891).utc,
        item:        job
      )
    end
  end
end
