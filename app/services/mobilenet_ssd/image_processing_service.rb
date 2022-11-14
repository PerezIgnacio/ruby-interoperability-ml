module MobilenetSsd
  class ImageProcessingService
    COCO_LABELS = {
      17 => 'cat',
      18 => 'dog',
      65 => 'bed'
    }

    def label_prediction(image, result)
      result["num_detections"].each_with_index do |detections, index|
        detections.to_i.times do |i|
          label = result["detection_classes"][index][i].to_i
          label = COCO_LABELS[label] || label
          box = result["detection_boxes"][index][i]

          draw_box(image, label, box)
        end
      end
      image
    end

    private

    def draw_box(img, label, box)
      width, height = img.dimensions

      # calculate box
      thickness = 2
      top = (box[0] * height).round - thickness
      left = (box[1] * width).round - thickness
      bottom = (box[2] * height).round + thickness
      right = (box[3] * width).round + thickness

      # draw box
      img.combine_options do |c|
        c.draw "rectangle #{left},#{top} #{right},#{bottom}"
        c.fill "none"
        c.stroke "blue"
        c.strokewidth thickness
      end

      # draw text
      img.combine_options do |c|
        c.draw "text #{left + 5},#{top + 16} \"#{label}\""
        c.fill "blue"
        c.pointsize 18
      end
    end
  end
end
