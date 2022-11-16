require './lib/onnx/models'

# Load model here to avoid initializing it in every request.
detection_model_path = Rails.root.join('lib', 'onnx', 'mobilenet_ssd.onnx')
segmentation_model_path = Rails.root.join('lib', 'onnx', 'fcn.onnx')

Onnx::Models.load_model(:mobilenet_ssd, detection_model_path)
Onnx::Models.load_model(:fcn, segmentation_model_path)
