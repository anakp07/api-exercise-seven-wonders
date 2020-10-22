require 'httparty'
require 'awesome_print'

LOCATION_IQ_KEY = "pk.d013f90e3f7abad9ee93a946c0f0a039"

BASE_URL = "https://locationiq.com/v1/search.php"

seven_wonders = ["Great Pyramid of Giza",
                 "Gardens of Babylon",
                 "Colossus of Rhodes",
                 "Pharos of Alexandria",
                 "Statue of Zeus at Olympia",
                 "Temple of Artemis",
                 "Mausoleum at Halicarnassus"]
seven_wonders_hash = {}
seven_wonders.each do |wonder|
  response = HTTParty.get(BASE_URL, query: {
      q:wonder,
      key: LOCATION_IQ_KEY,
      format: 'json'
  }
  )
  if response.code == 200
    seven_wonders_hash[wonder] = {
        "lat" => response.first["lat"],
        "lon" => response.first["lon"]
    }
    end
  end

ap seven_wonders_hash
# # pp response.first["lat"]
# puts "Latitude: #{response.first["lat"]}"
# puts "Longitude: #{response.first["lon"]}"