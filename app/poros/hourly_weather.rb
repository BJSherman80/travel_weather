class HourlyWeather
  attr_reader :time,
              :temperature,
              :wind_speed,
              :wind_direction,
              :conditions,
              :icon

  def initialize(data)
    @time = Time.at(data[:dt])
    @temperature = (data[:temp])
    @wind_speed = (data[:wind_speed])
    @wind_direction = data[:wind_direction]
    @conditions = data[:weather][0][:description]
    @icon = (data[:weather][0][:icon])
  end
end
