namespace :notifications do
  desc 'Deliver notifications'
  task deliver: :environment do
    DeliverEmails.new.perform mailer: NotificationsMailer,
      retriever: RetrieveEmails.new
  end
end
