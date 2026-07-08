RailsLiveReload.configure do |config|
  # Watch views
  config.watch %r{app/views/.+\.(erb|haml|slim)$}
  
  # Watch assets and force a reload on change
  config.watch %r{(app|vendor)/(assets|javascript)/\w+/(.+\.(css|js|html|png|jpg|ts|jsx)).*}, reload: :always

  # Watch translation files
  config.watch %r{config/locales/.+\.yml}, reload: :always

  # Only run this in development mode
  config.enabled = Rails.env.development?
end if defined?(RailsLiveReload)