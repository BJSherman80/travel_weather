class MunchiesFacade
  def self.fetch_data(location, _destination, food)
    resturant_data = YelpService.fetch_resturants(food, location)
  end
end
