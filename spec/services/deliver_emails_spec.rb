require 'ostruct'

describe DeliverEmails do
  let(:deliverer) { described_class.new }

  describe '#perform' do
    let(:emails) { ['email1@example.com', 'email2@example.com'] }
    let(:emails_retriever) { OpenStruct.new(emails: emails) }

    let(:mailer) { double(:mailer) }
    let(:email) { double(:email) }

    before do
      allow(mailer).to receive(:urgent).and_return(email)
      allow(email).to receive(:deliver)

      deliverer.perform(mailer: mailer, retriever: emails_retriever)
    end

    it 'delivers emails to the given list' do
      expect(email).to have_received(:deliver).exactly(emails.size).times

      emails.each do |email|
        expect(mailer).to have_received(:urgent).with(email)
      end
    end
  end
end
