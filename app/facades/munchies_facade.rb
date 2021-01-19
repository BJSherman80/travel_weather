class MunchiesFacade
  def self.fetch_data(location, _destination, food)
    resturant_data = YelpService.fetch_resturants(food, location)
    resturant = Resturant.new(resturant_data)
    binding.pry
  end

  def self.create_resturant(data)
    data.map do |resturant|
      Resturant.new(resturant)
    end
  end
end
