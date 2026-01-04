require_relative 'calculator_strategy_interface'

class AramexStrategy
  include CalculatorStrategyInterface

  def calculate(order)
    order.weight * 8 + 10
  end
end
