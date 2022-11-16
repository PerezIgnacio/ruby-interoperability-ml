require 'numo/narray'
require 'torchvision'

module Fcn
  class PreProcessingService
    def preprocess(image:)
      # Normalization
      mean=[0.485, 0.456, 0.406]
      std=[0.229, 0.224, 0.225]

      preprocess_transforms = TorchVision::Transforms::Compose.new([
        TorchVision::Transforms::ToTensor.new,
        TorchVision::Transforms::Normalize.new(mean, std)
      ])

      # When UInt8, ToTensor normalizes values from 0 to 1 (divides by 255)
      pixels = Numo::UInt8.cast(image.get_pixels)
      preprocess_transforms.call(pixels).to_a
    end
  end
end
