describe Sidekiq::Worker do
  describe '#job' do
    let(:worker) do
      Class.new { include Sidekiq::Worker }.new
    end

    it 'returns job attribute' do
      expect(worker.job).to eq(nil)
    end
  end
end
