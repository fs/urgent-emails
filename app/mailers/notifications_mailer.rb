class NotificationsMailer < ActionMailer::Base
  def urgent(receiver)
    @receiver = receiver

    mail(
      to: receiver,
      from: app_config.no_reply,
      subject: I18n.t('app.mailers.notifications.urgent.subject', email: receiver)
    )
  end
end
