class ImageDetectionsController < ApplicationController
  def show; end

  def create
    result = ImageDetectionService.new.predict(params[:image])
    @prediction = Base64.encode64(result.to_blob)
  end
end
