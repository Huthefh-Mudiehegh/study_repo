require_relative 'calculator_strategy_interface'

class FedExStrategy
  include CalculatorStrategyInterface

  def calculate(order)
    order.weight * 10 + 15
  end
end
