class DailyWeather
  attr_reader :date,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :icon

  def initialize(data)
    @date = Time.at(data[:dt]).in_time_zone
    @sunrise = Time.at(data[:sunrise]).in_time_zone
    @sunset = Time.at(data[:sunset]).in_time_zone
    binding.pry
    @max_temp = data[:temp][:max]
    @min_temp = data[:temp][:min]
    @conditions = data[:weather][0][:description]
    @icon = (data[:weather][0][:icon])
  end
end
