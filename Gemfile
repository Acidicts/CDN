source "https://rubygems.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 8.1.3"
# The modern asset pipeline for Rails [https://github.com/rails/propshaft]
gem "propshaft"
# Use PostgreSQL in development/production, sqlite3 in test
gem "pg"
gem "sqlite3", ">= 2.1", group: :test

# Redis for caching
gem "redis", "~> 5.0"
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"

# Use Active Storage with S3-compatible storage (iDrive E2)
gem "aws-sdk-s3", require: false

# IP geolocation for region assignment
gem "geocoder"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

group :development, :test do
  gem "dotenv-rails"

  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "rails_live_reload"
  gem "ruby-lsp"
  gem "ruby-lsp-rails"
end
