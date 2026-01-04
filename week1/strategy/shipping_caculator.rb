require_relative 'calculator_strategy_interface'

class ShippingCalculator
  include CalculatorStrategyInterface

  def initialize(strategy)
    @strategy = strategy
  end

  def calculate(order)
    strategy.calculate(order)
  end

  private

  attr_reader :strategy
end
