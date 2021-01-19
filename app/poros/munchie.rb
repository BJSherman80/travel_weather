class Munchie
  attr_reader :destination,
              :resturant,
              :current_weather

  def initialize(destination, resturant, current_weather)
    @destination = destination
    @resturant = resturant
    @current_weather = current_weather
  end
end
