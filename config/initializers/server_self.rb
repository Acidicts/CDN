Rails.application.config.after_initialize do
  Server.create_find_self if ActiveRecord::Base.connection.table_exists?(:servers)
end
