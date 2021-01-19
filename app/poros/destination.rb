class Destination
  attr_reader :city,
              :travel_time

  def initialize(data)
    @city = data[:route][:legs][0][:destNarrative]
    @travel_time = Time.at(data[:route][:realTime]).utc.strftime('%H hours %M minutes %S seconds')
  end
end
