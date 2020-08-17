describe Sidekiq::Worker::Job do
  describe '.version' do
    it 'has a version number' do
      expect(described_class::VERSION).to eq('0.2.1')
    end
  end

  describe '.new_from_payload' do
    let(:attributes) do
      {
        'class'       => 'SomeWorker',
        'queue'       => 'queue',
        'jid'         => 'b4a577edbccf1d805744efa9',
        'args'        => [1, 'arg', true],
        'created_at'  => 1234567890,
        'enqueued_at' => 1234567891
      }
    end

    it 'initializes job from payload' do
      expect(described_class.new_from_payload(attributes)).to have_attributes(
        class:       Sidekiq::Job,
        klass:       'SomeWorker',
        queue:       'queue',
        jid:         'b4a577edbccf1d805744efa9',
        args:        [1, 'arg', true],
        created_at:  Time.at(1234567890).utc,
        enqueued_at: Time.at(1234567891).utc,
        item:        attributes
      )
    end
  end

  describe '.list_from_queues' do
    let(:worker) do
      Class.new { include Sidekiq::Worker }
    end

    before do
      Sidekiq::Queue.all.each(&:clear)
    end

    context 'when there are jobs in the queue' do
      before do
        worker.set(queue: 'queue').perform_async
      end

      it 'returns a non-empty array' do
        expect(described_class.list_from_queues).not_to eq([])
      end

      it 'returns jobs' do
        expect(described_class.list_from_queues).to all have_attributes(
          class: Sidekiq::Job,
          queue: 'queue'
        )
      end
    end

    context 'when there are no jobs in the queue' do
      it 'returns an empty array' do
        expect(described_class.list_from_queues).to eq([])
      end
    end
  end

  describe '.list_from_workers' do
    context 'when there are no jobs in workers' do
      it 'returns an empty array' do
        expect(described_class.list_from_workers).to eq([])
      end
    end
  end
end
