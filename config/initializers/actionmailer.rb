require_relative 'app_config'

ActionMailer::Base.view_paths = File.join(app_config.root, 'app/views')
ActionMailer::Base.smtp_settings = {
  address: 'smtp.sendgrid.net',
  port: '25',
  authentication: :plain,
  user_name: ENV['SENDGRID_USERNAME'],
  password: ENV['SENDGRID_PASSWORD'],
  domain: ENV['SENDGRID_DOMAIN']
}
