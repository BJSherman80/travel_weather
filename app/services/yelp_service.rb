class YelpService
  def self.fetch_resturants(food, destination)
    conn = Faraday.new('https://api.yelp.com') do |f|
      f.headers['Authorization'] = ENV['YELP_API_KEY']
    end
    response = conn.get('/v3/businesses/search') do |f|
      f.params[:location] = destination
      f.params[:categories] = food
      f.params[:limit] = 1
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
