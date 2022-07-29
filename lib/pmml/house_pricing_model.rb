require 'eps'

class HousePricingModel
  attr_accessor :model

  def initialize
    @model = load_model
  end

  def predict(house_features)
    model.predict(house_features)
  end

  private

  def load_model
    Eps::Model.load_pmml(File.read(file_path))
  end

  def file_path
    File.join(__dir__, 'model.pmml')
  end
end

