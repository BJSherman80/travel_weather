class GeoService
  def self.fetch_lat_long(location)
    conn = Faraday.new('https://www.mapquestapi.com')
    response = conn.get("/geocoding/v1/address?key=#{ENV['GEO_KEY']}&inFormat=kvp&outFormat=json&location=#{location}&thumbMaps=false")
    json = JSON.parse(response.body, symbolize_names: true)
    lat_long_parsed(json)
  end

  def self.lat_long_parsed(json)
    [(json[:results][0][:locations][0][:latLng][:lat]).to_f, (json[:results][0][:locations][0][:latLng][:lng]).to_f]
  end
end
