class ImageSerializer
  include FastJsonapi::ObjectSerializer
  set_id { nil }
  attributes :image, :description, :photographer, :credit
end
