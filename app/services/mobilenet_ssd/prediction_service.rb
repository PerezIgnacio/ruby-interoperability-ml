module MobilenetSsd
  class PredictionService
    def predict(uploaded_file)
      image = MiniMagick::Image.read(uploaded_file.read)
      result = Onnx::Models.predict(:mobilenet_ssd, { inputs: [image.get_pixels] })
      ImageProcessingService.new.label_prediction(image, result)
    end
  end
end
