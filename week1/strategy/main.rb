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

require 'ostruct'
require_relative 'shipping_caculator'
require_relative 'fedex_strategy'
require_relative 'dhl_strategy'
require_relative 'aramex_strategy'

strategy = AramexStrategy.new
calc = ShippingCalculator.new(strategy)
puts calc.calculate(OpenStruct.new(weight: 5))
