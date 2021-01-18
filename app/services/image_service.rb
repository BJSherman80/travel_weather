class ImageService
  def self.fetch_image(location)
    conn = Faraday.new('https://api.unsplash.com')
    response = conn.get('/search/photos') do |f|
      f.params[:client_id] = ENV['IMAGE_KEY']
      f.params[:query] = location
      f.params[:per_page] = 1
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
