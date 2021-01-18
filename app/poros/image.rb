class Image
  attr_reader :image,
              :description,
              :photographer,
              :credit

  def initialize(data)
    @image = (data[:results][0][:urls][:regular])
    @description = (data[:results][0][:description])
    @photographer = (data[:results][0][:user][:links][:html])
    @credit = 'Credit to Unsplash.com'
  end
end
