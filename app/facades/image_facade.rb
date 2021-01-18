class ImageFacade
  def self.fetch_image(location)
    data = ImageService.fetch_image(location)
    Image.new(data)
  end
end
