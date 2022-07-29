require 'onnxruntime'

class ImageDetectionModel
  attr_accessor :model

  def initialize
    @model = load_model
  end

  def predict(image_pixels)
    model.predict({inputs: [image_pixels]})
  end

  private

  def load_model
    OnnxRuntime::Model.new(file_path)
  end

  def file_path
    File.join(__dir__, 'model.onnx')
  end
end
