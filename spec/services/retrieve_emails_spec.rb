describe RetrieveEmails do
  let(:retriever) { described_class.new }

  describe '#emails' do
    before do
      ENV['EMAILS'] = 'valid@example.com,invalid,test,valid1@example.com'
    end

    subject(:emails) { retriever.emails.to_a }

    after { ENV['EMAILS'] = nil }

    it { is_expected.to eq ['valid@example.com', 'valid1@example.com'] }
  end
end
