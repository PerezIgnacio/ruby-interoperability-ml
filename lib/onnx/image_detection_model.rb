module Onnx
  module ImageDetectionModel
    class << self
      def load_model
        @@model = OnnxRuntime::Model.new(model_path)
      end

      def model_path=(model_path)
        @@model_path = model_path
      end

      def model_path
        return @@model_path unless @@model_path.blank?

        raise "Model path not configured. Use ImageDetectionModel.model_path = 'my_path'"
      end

      def predict(image_pixels)
        @@model.predict({inputs: [image_pixels]})
      end
    end
  end
end
