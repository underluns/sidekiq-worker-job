describe Sidekiq::Worker do
  describe '#job' do
    let(:worker_class) do
      Class.new do
        include Sidekiq::Worker
      end
    end

    let(:worker) { worker_class.new }

    it 'returns job attribute' do
      expect(worker.job).to eq(nil)
    end
  end
end
