require './lib/onnx/image_detection_model'

Onnx::ImageDetectionModel.model_path = Rails.root.join('lib', 'onnx', 'model.onnx')
Onnx::ImageDetectionModel.load_model
