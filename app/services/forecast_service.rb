class ForecastService
  def self.fetch_weather(lat_long)
    conn = Faraday.new('https://api.openweathermap.org')
    response = conn.get('/data/2.5/onecall') do |f|
      f.params['appid'] = ENV['WEATHER_KEY']
      f.params[:units] = 'imperial'
      f.params[:exclude] = 'minutely,alerts'
      f.params[:lat] = lat_long[0]
      f.params[:lon] = lat_long[1]
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
