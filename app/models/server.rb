# == Schema Information
#
# Table name: servers
#
#  id         :integer          not null, primary key
#  region     :integer
#  domain     :string
#  self       :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Server < ApplicationRecord
  has_one :edge

  after_create :set_region

  attribute :requests, :integer, default: 0
  attribute :domain, :string, default: ""

  enum :region, {
    "us_east": 0,
    "us_west": 1,
    "eu_west": 2,
    "eu_central": 3,
    "ap_southeast": 4,
    "ap_northeast": 5,
    "ap_south": 6,
    "sa_east": 7,
  }

  def self.create_find_self
    server = find_or_create_by!(self: true)
    if server.domain.blank?
      url = ENV["APP_URL"] || "https://#{Socket.gethostname}"
      server.update!(domain: url)
    end
    server.set_region
    server
  end

  def set_region
    return unless domain.present?

    host = URI.parse(domain).host || domain
    ip = Resolv.getaddress(host)
    result = Geocoder.search(ip).first
    self.region = region_from_country(result&.country)

    save! if persisted?
  rescue StandardError
    self.region ||= :us_east
    save! if persisted?
  end

  private

  def region_from_country(country_code)
    case country_code
    when "US"
      :us_east
    when "CA"
      :us_east
    when "GB", "IE", "FR", "DE", "NL", "BE", "LU", "DK", "NO", "SE", "FI", "PT", "ES", "IT"
      :eu_west
    when "PL", "CZ", "SK", "AT", "CH", "HU", "RO", "BG", "GR"
      :eu_central
    when "JP", "KR", "TW", "HK", "SG", "MY", "TH", "VN", "PH", "ID"
      :ap_southeast
    when "AU", "NZ"
      :ap_southeast
    when "IN", "PK", "BD", "LK", "NP"
      :ap_south
    when "RU", "UA"
      :eu_central
    when "BR", "AR", "CL", "CO", "PE", "UY"
      :sa_east
    else
      :us_east
    end
  end
end
