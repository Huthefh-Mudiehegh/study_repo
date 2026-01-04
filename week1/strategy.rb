# Problem
#
# class ShippingCalculator
#   def calculate(order, method)
#     if method == :fedex
#       order.weight * 10 + 15
#     elsif method == :aramex
#       order.weight * 8 + 10
#     elsif method == :dhl
#       order.weight * 12 + 20
#     else
#       raise "Unknown shipping method"
#     end
#   end
# end

# calc = ShippingCalculator.new
# puts calc.calculate(OpenStruct.new(weight: 5), :fedex)

module CalculatorStrategy
  def calculate(order)
    raise NotImplementedError
  end
end

# FedEx Strategy
class FedExStrategy
  include CalculatorStrategy

  def calculate(order)
    order.weight * 10 + 15
  end
end

# Aramex Strategy
class AramexStrategy
  include CalculatorStrategy

  def calculate(order)
    order.weight * 8 + 10
  end
end

# DHL Strategy
class DhlStrategy
  include CalculatorStrategy

  def calculate(order)
    order.weight * 12 + 20
  end
end

class ShippingCalculator
  include CalculatorStrategy

  def initialize(strategy)
    @strategy = strategy
  end

  def calculate(order)
    strategy.calculate(order)
  end

  private

  attr_reader :strategy
end

class System
  def call
    calc = ShippingCalculator.new(FedExStrategy.new)
    puts calc.calculate(OpenStruct.new(weight: 5))
  end
end
