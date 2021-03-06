require_relative '../spec_helper'

describe NotificationsMailer do
  describe '.urgent' do
    let(:receiver) { 'my@example.com' }
    let(:email) { NotificationsMailer.urgent(receiver) }

    it 'sets subject' do
      email.subject.must_equal I18n.t('app.mailers.notifications.urgent.subject', email: receiver)
    end

    it 'delivers email to receiver' do
      email.to.must_equal [receiver]
    end

    it 'delivers email from no-reply address' do
      email.from.must_equal [app_config.no_reply]
    end

    it 'contains urgent message' do
      email.body.must_include I18n.t('app.mailers.notifications.urgent.body', email: receiver)
    end
  end
end
