describe Sidekiq::Worker::Job do
  describe '.version' do
    it 'has a version number' do
      expect(described_class::VERSION).to eq('0.1.0')
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
        class:       described_class,
        worker_name: 'SomeWorker',
        queue_name:  'queue',
        id:          'b4a577edbccf1d805744efa9',
        args:        [1, 'arg', true],
        created_at:  1234567890,
        enqueued_at: 1234567891
      )
    end

    context 'when parameter class is missing' do
      before do
        attributes.delete('class')
      end

      it 'raises an error' do
        expect { described_class.new_from_payload(attributes) }.to raise_error(KeyError, 'key not found: "class"')
      end
    end

    context 'when parameter queue is missing' do
      before do
        attributes.delete('queue')
      end

      it 'raises an error' do
        expect { described_class.new_from_payload(attributes) }.to raise_error(KeyError, 'key not found: "queue"')
      end
    end

    context 'when parameter jid is missing' do
      before do
        attributes.delete('jid')
      end

      it 'raises an error' do
        expect { described_class.new_from_payload(attributes) }.to raise_error(KeyError, 'key not found: "jid"')
      end
    end

    context 'when parameter args is missing' do
      before do
        attributes.delete('args')
      end

      it 'raises an error' do
        expect { described_class.new_from_payload(attributes) }.to raise_error(KeyError, 'key not found: "args"')
      end
    end

    context 'when parameter created_at is missing' do
      before do
        attributes.delete('created_at')
      end

      it 'raises an error' do
        expect { described_class.new_from_payload(attributes) }.to raise_error(KeyError, 'key not found: "created_at"')
      end
    end

    context 'when parameter enqueued_at is missing' do
      before do
        attributes.delete('enqueued_at')
      end

      it 'raises an error' do
        expect { described_class.new_from_payload(attributes) }.to raise_error(KeyError, 'key not found: "enqueued_at"')
      end
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
