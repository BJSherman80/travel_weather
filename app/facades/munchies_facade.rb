class MunchiesFacade
  def self.fetch_data(location, destination, food)
    resturant_data = YelpService.fetch_resturants(food, location)
    resturant = Resturant.new(resturant_data)
    travel_data = GeoService.fetch_travel_data(location, destination)
    destination = Destination.new(travel_data)
  end
end
