require_relative 'app_config.rb'

I18n.enforce_available_locales = true
I18n.load_path += Dir[File.join(app_config.root, 'config/locales', '*.yml')]
I18n.backend.load_translations
