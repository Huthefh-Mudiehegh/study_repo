require_relative 'calculator_strategy_interface'

class DhlStrategy
  include CalculatorStrategyInterface

  def calculate(order)
    order.weight * 12 + 20
  end
end
