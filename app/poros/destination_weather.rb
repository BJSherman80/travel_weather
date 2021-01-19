class DestinationWeather
  attr_reader :summary,
              :temperature

  def initialize(data)
    @temperature = (data[:temp])
    @summary = (data[:weather][0][:description])
  end
end
