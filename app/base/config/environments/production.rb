Rails.application.configure do
  config.i18n.fallbacks = true
  config.cache_classes = true
  config.eager_load = true
  config.serve_static_files = false
  config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect'
  config.consider_all_requests_local = false
  config.log_level = :debug
  config.log_formatter = Logger::Formatter.new
  config.action_controller.perform_caching = true
  config.active_support.deprecation = :notify

  config.assets.js_compressor = :uglifier
  config.assets.compile = false
  config.assets.digest = true

  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.perform_deliveries = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.default_url_options = { host: config.app_domain }
end
