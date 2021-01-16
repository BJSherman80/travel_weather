class GeoService
  def self.fetch_lat_long(location)
    conn = Faraday.new('https://www.mapquestapi.com')
    response = conn.get("/geocoding/v1/address?key=#{ENV['GEO_KEY']}&inFormat=kvp&outFormat=json&location=#{location}&thumbMaps=false")
    json = JSON.parse(response.body, symbolize_names: true)
    binding.pry
  end
end
