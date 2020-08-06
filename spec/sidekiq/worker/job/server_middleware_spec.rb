describe Sidekiq::Worker::Job::ServerMiddleware do
  let(:middleware) { described_class.new }

  describe '#call' do
    let(:worker_class) do
      Class.new do
        include Sidekiq::Worker
      end
    end

    let(:worker) { worker_class.new }
    let(:queue)  { 'queue_name' }
    let(:job) do
      {
        'class'       => 'SomeWorker',
        'queue'       => 'default',
        'jid'         => 'b4a577edbccf1d805744efa9',
        'args'        => [1, 'arg', true],
        'created_at'  => 1234567890,
        'enqueued_at' => 1234567891
      }
    end

    it 'sets the job parameter' do
      middleware.call(worker, job, queue) {}
      expect(worker.job).to be_instance_of(Sidekiq::Worker::Job)
    end

    it 'sets attribute worker_name for the job' do
      middleware.call(worker, job, queue) {}
      expect(worker.job.worker_name).to eq('SomeWorker')
    end

    it 'sets attribute queue_name for the job' do
      middleware.call(worker, job, queue) {}
      expect(worker.job.queue_name).to eq('default')
    end

    it 'sets attribute id for the job' do
      middleware.call(worker, job, queue) {}
      expect(worker.job.id).to eq('b4a577edbccf1d805744efa9')
    end

    it 'sets attribute args for the job' do
      middleware.call(worker, job, queue) {}
      expect(worker.job.args).to eq([1, 'arg', true])
    end

    it 'sets attribute created_at for the job' do
      middleware.call(worker, job, queue) {}
      expect(worker.job.created_at).to eq(1234567890)
    end

    it 'sets attribute enqueued_at for the job' do
      middleware.call(worker, job, queue) {}
      expect(worker.job.enqueued_at).to eq(1234567891)
    end

    context 'when parameter class is missing' do
      before do
        job.delete('class')
      end

      it 'raises an error' do
        expect { middleware.call(worker, job, queue) {} }.to raise_error(KeyError, 'key not found: "class"')
      end
    end

    context 'when parameter queue is missing' do
      before do
        job.delete('queue')
      end

      it 'raises an error' do
        expect { middleware.call(worker, job, queue) {} }.to raise_error(KeyError, 'key not found: "queue"')
      end
    end

    context 'when parameter jid is missing' do
      before do
        job.delete('jid')
      end

      it 'raises an error' do
        expect { middleware.call(worker, job, queue) {} }.to raise_error(KeyError, 'key not found: "jid"')
      end
    end

    context 'when parameter args is missing' do
      before do
        job.delete('args')
      end

      it 'raises an error' do
        expect { middleware.call(worker, job, queue) {} }.to raise_error(KeyError, 'key not found: "args"')
      end
    end

    context 'when parameter created_at is missing' do
      before do
        job.delete('created_at')
      end

      it 'raises an error' do
        expect { middleware.call(worker, job, queue) {} }.to raise_error(KeyError, 'key not found: "created_at"')
      end
    end

    context 'when parameter enqueued_at is missing' do
      before do
        job.delete('enqueued_at')
      end

      it 'raises an error' do
        expect { middleware.call(worker, job, queue) {} }.to raise_error(KeyError, 'key not found: "enqueued_at"')
      end
    end
  end
end
