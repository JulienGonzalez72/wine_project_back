require "net/http"

class WineSeeder
  EXTERNAL_URL = "http://api.sampleapis.com/wines/rose"

  def call
    res = get_request
    wines = res.map do |api_wine|
      to_wine api_wine
    end
    ActiveRecord::Base.transaction do
      Wine.all.each(&:destroy!) # reset every wine
      wines.each(&:save!)
    end
  end

  private

  # Put your conversion implementation here
  def to_wine(api_wine)
    Wine.new(
      color: "pink",
      name: api_wine["wine"],
      price_cents: 0, # we don't know
      website: "http://api.sampleapis.com/wines/rose" # we don't know either
    )
  end

  def get_request
    url = URI.parse(EXTERNAL_URL)
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) { |http|
      http.request(req)
    }
    JSON.parse res.body
  end
end
