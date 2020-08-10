describe Sidekiq::Worker::Job do
  describe '.version' do
    it 'has a version number' do
      expect(described_class::VERSION).to eq('0.1.0')
    end
  end

  describe '#queue' do
    let(:job) { described_class.new(**attributes) }
    let(:attributes) do
      {
        worker_name: 'SomeWorker',
        queue_name:  'queue',
        id:          'b4a577edbccf1d805744efa9',
        args:        [1, 'arg', true],
        created_at:  1234567890,
        enqueued_at: 1234567891
      }
    end

    it 'returns the sidekiq queue' do
      expect(job.queue).to have_attributes(class: Sidekiq::Queue, name: 'queue')
    end

    context 'when the queue is nil' do
      before do
        attributes[:queue_name] = nil
      end

      it 'returns the default sidekiq queue' do
        expect(job.queue).to have_attributes(class: Sidekiq::Queue, name: 'default')
      end
    end
  end
end
