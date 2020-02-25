require File.expand_path('boot', __dir__)
require 'rails/all'

Bundler.require *Rails.groups

class Application < Rails::Application

  config.i18n.load_path += Dir[Rails.root.join('config/locales/*/*.yml')]
  config.i18n.default_locale = :en

end
