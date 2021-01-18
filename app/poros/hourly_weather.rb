class HourlyWeather
  attr_reader :time,
              :temperature,
              :wind_speed,
              :wind_direction,
              :conditions,
              :icon

  def initialize(data)
    @time = Time.at(data[:dt]).in_time_zone
    @temperature = (data[:temp])
    @wind_speed = (data[:wind_speed])
    @wind_direction = cardinal_direction(data[:wind_deg])
    @conditions = data[:weather][0][:description]
    @icon = (data[:weather][0][:icon])
  end

  def cardinal_direction(num)
    if num.nil?
      num = 'No Wind'
    else
      val = ((num / 22.5) + 0.5).to_i
      arr = %w[N NNE NE ENE E ESE SE SSE S SSW SW WSW W WNW NW NNW]
      arr[(val % 17)]
    end
  end
end
