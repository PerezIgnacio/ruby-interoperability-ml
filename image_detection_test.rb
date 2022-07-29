require './lib/onnx/image_detection_model.rb'
require './utils/image_processor.rb'
require 'mini_magick'

image = MiniMagick::Image.open('data/catdog.jpeg')
pixels = image.get_pixels

result = ImageDetectionModel.new.predict(pixels)

ImageProcessor.new.label_prediction(image, result)

puts 'Prediction completed, check labeled.png under /data folder'
