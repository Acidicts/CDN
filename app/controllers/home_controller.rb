class HomeController < ApplicationController
  def index
    @servers = Rails.cache.fetch("server_regions", expires_in: 5.minutes) do
      {
        "count" => Server.count,
        "eu_west" => Server.where(region: :eu_west).any?,
        "us_east" => Server.where(region: :us_east).any?,
        "ap-south" => Server.where(region: :ap_south).any?,
        "sa-east" => Server.where(region: :sa_east).any?
      }
    end
  end
end
