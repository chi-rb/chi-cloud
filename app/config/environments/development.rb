Rails.application.configure do
  config.i18n.fallbacks = true
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = true
  config.action_controller.perform_caching = false
  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load
  config.log_level = :debug

  config.assets.raise_runtime_errors = true
  config.assets.debug = true
  config.assets.digest = true

  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.delivery_method = :test
  config.action_mailer.default_url_options = { host: 'localhost' }
end
