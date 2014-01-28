namespace :notifications do
  desc 'Deliver notifications'
  task :deliver, [:day_to_perform] => :environment do |t, args|
    args.with_defaults(day_to_perform: :friday)

    if Time.now.respond_to?("#{args[:day_to_perform]}?") &&
      Time.now.public_send("#{args[:day_to_perform]}?")

      DeliverEmails.new.perform mailer: NotificationsMailer,
        retriever: RetrieveEmails.new
    end
  end
end
