Rails.application.routes.draw do
  root "image_detections#show"

  resource :image_detections, only: [:show, :create]
end
