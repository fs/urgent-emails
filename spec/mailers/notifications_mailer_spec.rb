require 'rails_helper'

describe NotificationsMailer do
  describe '.urgent' do
    let(:receiver) { 'my@example.com' }

    subject(:email) { described_class.urgent(receiver) }

    its(:subject) do
      is_expected.to eq I18n.t(
        'app.mailers.notifications.urgent.subject',
        email: receiver
      )
    end

    its(:to) { is_expected.to eq [receiver] }
    its(:from) { is_expected.to eq [app_config.no_reply] }

    its(:body) do
      is_expected.to include I18n.t(
        'app.mailers.notifications.urgent.body',
        email: receiver
      )
    end
  end
end
