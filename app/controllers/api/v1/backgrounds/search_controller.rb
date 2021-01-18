class Api::V1::Backgrounds::SearchController < ApplicationController
  def show
    render json: ImageSerializer.new(ImageFacade.fetch_image(params[:location]))
  end
end
