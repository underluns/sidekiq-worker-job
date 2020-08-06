describe Sidekiq::Worker::Job do
  describe '.version' do
    it 'has a version number' do
      expect(described_class::VERSION).to eq('0.0.1')
    end
  end

  describe '.new' do
    let(:job) { described_class.new(attributes) }
    let(:attributes) do
      {
        'class'       => 'SomeWorker',
        'queue'       => 'default',
        'jid'         => 'b4a577edbccf1d805744efa9',
        'args'        => [1, 'arg', true],
        'created_at'  => 1234567890,
        'enqueued_at' => 1234567891
      }
    end

    it 'sets worker_name' do
      expect(job.worker_name).to eq('SomeWorker')
    end

    it 'sets queue_name' do
      expect(job.queue_name).to eq('default')
    end

    it 'sets id' do
      expect(job.id).to eq('b4a577edbccf1d805744efa9')
    end

    it 'sets args' do
      expect(job.args).to eq([1, 'arg', true])
    end

    it 'sets created_at' do
      expect(job.created_at).to eq(1234567890)
    end

    it 'sets enqueued_at' do
      expect(job.enqueued_at).to eq(1234567891)
    end

    context 'when parameter class is missing' do
      before do
        attributes.delete('class')
      end

      it 'raises an error' do
        expect { job }.to raise_error(KeyError, 'key not found: "class"')
      end
    end

    context 'when parameter queue is missing' do
      before do
        attributes.delete('queue')
      end

      it 'raises an error' do
        expect { job }.to raise_error(KeyError, 'key not found: "queue"')
      end
    end

    context 'when parameter jid is missing' do
      before do
        attributes.delete('jid')
      end

      it 'raises an error' do
        expect { job {} }.to raise_error(KeyError, 'key not found: "jid"')
      end
    end

    context 'when parameter args is missing' do
      before do
        attributes.delete('args')
      end

      it 'raises an error' do
        expect { job }.to raise_error(KeyError, 'key not found: "args"')
      end
    end

    context 'when parameter created_at is missing' do
      before do
        attributes.delete('created_at')
      end

      it 'raises an error' do
        expect { job }.to raise_error(KeyError, 'key not found: "created_at"')
      end
    end

    context 'when parameter enqueued_at is missing' do
      before do
        attributes.delete('enqueued_at')
      end

      it 'raises an error' do
        expect { job }.to raise_error(KeyError, 'key not found: "enqueued_at"')
      end
    end
  end
end
