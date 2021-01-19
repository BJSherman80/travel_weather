class YelpService
  def self.fetch_resturants(food, location)
    binding.pry
    conn = Faraday.new('https://api.yelp.com') do |f|
      f.headers['Authorization'] = ENV['YELP_API_KEY']
		end
		response = conn.get("/v3/businesses/search") do |f|
			f.params[:location] = location
			f.params[:categories] = category
		end
		parsed_json = JSON.parse(response.body, symbolize_names: true)
	end
