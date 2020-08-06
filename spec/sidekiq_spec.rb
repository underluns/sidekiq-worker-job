describe Sidekiq do
  describe '.server_middleware' do
    it 'includes middleware' do
      expect(described_class.server_middleware.exists?(Sidekiq::Worker::Job::ServerMiddleware)).to eq(true)
    end
  end
end
