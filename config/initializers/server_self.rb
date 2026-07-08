Rails.application.config.after_initialize do
  Server.create_find_self
end
