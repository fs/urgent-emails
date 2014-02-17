require_relative '../spec_helper.rb'

describe RetrieveEmails do
  let(:retriever) { RetrieveEmails.new }

  describe '#emails' do
    let(:emails) { retriever.emails }

    before do
      ENV['EMAILS'] = 'valid@example.com,invalid,test,valid1@example.com'
    end

    after { ENV['EMAILS'] = nil }

    it 'skips invalid emails' do
      emails.to_a.must_equal ['valid@example.com', 'valid1@example.com']
    end
  end
end
