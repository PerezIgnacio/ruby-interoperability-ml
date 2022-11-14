class ImageDetectionService
  def predict(model_name, uploaded_file)
    model_name.camelize.constantize::PredictionService.new.predict(uploaded_file)
  end
end
