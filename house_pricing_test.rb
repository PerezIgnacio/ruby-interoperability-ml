require './lib/pmml/house_pricing_model.rb'

# TODO: allow to input data without being normalized (transform data on pmml pipeline)
# Maybe compare with expected result (does not really matter though).

example_1 = {
  x1: -1.06802853,
  x2: 0.58538973,
  x3: -0.76183788,
  x4: -0.04981414,
  x5: 0.03830991,
  x6: 0.78363079,
  x7: -0.02212783,
  x8: -0.05012932,
  x9: -0.00643196,
  x10: -0.11907634,
  x11: 0.14111491,
  x12: 0.07917713,
  x13: 1.0,
  x14: 0.0,
  x15: 0.0,
  x16: 0.0,
  x17: 0.0
}

example_2 = {
  x1: 1.2588987,
  x2: -1.41268784,
  x3: -0.60318051,
  x4: 1.53747981,
  x5: 1.56687162,
  x6: 2.05360127,
  x7: 1.66464538,
  x8: -0.32016746,
  x9: -0.00643196,
  x10: -0.06264928,
  x11: 0.01797446,
  x12: -0.2163848,
  x13: 0,
  x14: 0,
  x15: 0,
  x16: 0,
  x17: 1
}

model = HousePricingModel.new

puts 'Predicting first example'
puts "Result: #{model.predict(example_1)}"
puts "="*10
puts 'Predicting second example'
puts "Result: #{model.predict(example_2)}"
