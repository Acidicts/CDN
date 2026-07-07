# frozen_string_literal: true

Rails.application.config.to_prepare do
  require "aws-sdk-s3"

  Aws.config[:instance_profile_credentials_timeout] = 1
  Aws.config[:instance_profile_credentials_retries] = 0

  required_vars = %w[
    AWS_ACCESS_KEY_ID
    AWS_SECRET_ACCESS_KEY
    AWS_BUCKET
    AWS_ENDPOINT
  ]

  missing = required_vars.reject { |var| ENV[var]&.present? }

  if missing.any?
    Rails.logger.warn "[ActiveStorage] Missing iDrive E2 env vars: #{missing.join(', ')}"
  else
    Rails.logger.info "[ActiveStorage] iDrive E2 S3 config loaded"
  end
end
