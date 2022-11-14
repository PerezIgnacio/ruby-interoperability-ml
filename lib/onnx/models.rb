module Onnx
  module Models
    @@models = {}

    class << self
      def load_model(model, path)
        @@models[model] = OnnxRuntime::Model.new(path)
      end

      def predict(model, input)
        @@models[model].predict(input)
      end
    end
  end
end
