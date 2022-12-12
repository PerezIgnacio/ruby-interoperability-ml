module Fcn
  class PredictionService
    LABELS = ['background', 'aeroplane', 'bicycle', 'bird', 'boat', 'bottle',
              'bus', 'car', 'cat', 'chair', 'cow', 'diningtable',
              'dog', 'horse', 'motorbike', 'person', 'pottedplant',
              'sheep', 'sofa', 'train', 'tvmonitor'].freeze

    def predict(uploaded_file)
      image = MiniMagick::Image.read(uploaded_file.read)
      input = PreProcessingService.new.preprocess(image: image)

      result = Onnx::Models.predict(:fcn, { input: [input] })

      ImageProcessingService.new.process(image: image, result: result)
    end
  end
end
