class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
  set_id { nil }
  attributes :location, :destination, :travel_time, :arrival_forecast
end
