require_relative '../spec_helper.rb'

describe RetrieveEmails do
  let(:retriever) { RetrieveEmails.new }
  let(:emails_path) { fixture_path('emails.text') }

  describe '#emails' do
    let(:emails) { retriever.emails }

    describe "when emails file doesn't exist" do
      it 'raises Errno::ENOENT error' do
        RetrieveEmails.stub_const(:FILE, 'invalid.text') do
          -> { emails.to_a }.must_raise(Errno::ENOENT)
        end
      end
    end

    it 'skips invalid emails' do
      RetrieveEmails.stub_const(:FILE, emails_path) do
        emails.to_a.must_equal ['valid@example.com', 'valid1@example.com']
      end
    end
  end
end
