class MunchieSerializer
  include FastJsonapi::ObjectSerializer
  set_id { nil }
  attributes :destination, :current_weather, :resturant
end
