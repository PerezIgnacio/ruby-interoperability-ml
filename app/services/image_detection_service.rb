class ImageDetectionService
  def predict(uploaded_file)
    image = MiniMagick::Image.read(uploaded_file.read)
    result = Onnx::ImageDetectionModel.predict(image.get_pixels)
    ImageProcessingService.new.label_prediction(image, result)
  end
end
