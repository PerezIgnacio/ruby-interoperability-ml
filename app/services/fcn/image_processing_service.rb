require 'numo/narray'

module Fcn
  class ImageProcessingService
    def process(image:, result:)
      # Get predicted class
      raw_labels = Numo::DFloat.cast(result['out'][0]).argmax(axis: 0)
      colorized_labels = colorize_labels(raw_labels)
      generate_predicted_image(image, colorized_labels)
    end

    private

    def colorize_labels(labels)
      labels.to_a.map do |row|
        row.map do |label|
          color_from_label_index(label)
        end
      end
    end

    def color_from_label_index(index)
      color_palette[index]
    end

    def color_palette
      # 27 in total. Only need 21 (number of possible labels from model).
      @color_palette ||= [0, 128, 255].repeated_permutation(3).to_a
    end

    def generate_predicted_image(image, labeled_pixels)
      dimensions = [image.width, image.height]
      overlay = image_from_pixels(pixels: labeled_pixels, dimensions: dimensions)

      image.composite(overlay) { |c| c.blend '30x70' }
    end

    def image_from_pixels(pixels:, dimensions:)
      depth = 8 # number of bits per channel
      pixel_map = 'rgb'
      file_format = 'jpg'

      MiniMagick::Image.get_image_from_pixels(pixels, dimensions, pixel_map, depth, file_format)
    end
  end
end
