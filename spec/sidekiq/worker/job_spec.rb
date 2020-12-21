describe Sidekiq::Worker::Job do
  describe '.version' do
    it 'has a version number' do
      expect(described_class::VERSION).to eq('0.4.1')
    end
  end
end
