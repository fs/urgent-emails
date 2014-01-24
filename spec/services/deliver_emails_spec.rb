require_relative '../spec_helper.rb'
require 'ostruct.rb'

describe DeliverEmails do
  let(:deliverer) { DeliverEmails.new }

  describe '#perform' do
    let(:emails) { ['email1@example.com', 'email2@example.com'] }
    let(:emails_retriever) { OpenStruct.new(emails: emails) }
    let(:mailer) { MiniTest::Mock.new }
    let(:mail) { MiniTest::Mock.new }

    it 'delivers emails to the given list' do
      mailer.expect(:urgent, mail, ['email1@example.com'])
      mailer.expect(:urgent, mail, ['email2@example.com'])
      2.times{ mail.expect(:deliver, nil) }

      deliverer.perform(mailer: mailer, retriever: emails_retriever)

      mailer.verify
    end
  end
end
