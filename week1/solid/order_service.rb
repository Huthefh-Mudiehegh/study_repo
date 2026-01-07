# class OrderService
#   def checkout(order, user, discount_type)
#     total = 0

#     order.items.each do |item|
#       total += item.price * item.quantity
#     end

#     if discount_type == :vip
#       total *= 0.8
#     elsif discount_type == :coupon
#       total -= 20
#     elsif discount_type == :seasonal
#       total *= 0.9
#     end

#     if user.email
#       puts "Sending email to #{user.email}"
#     end

#     if user.phone
#       puts "Sending SMS to #{user.phone}"
#     end

#     puts "Saving order with total #{total}"
#     total
#   end
# end

class OrderService
  def initialize(order, user, discount_service: nil)
    @order = order
    @user = user
    @discount_service = discount_service
  end

  def checkout
    @total = discount_service.present? ? apply_discount : calculate_total
    notify_user
    print_order
  end

  private

  attr_reader :order, :user, :discount_service, :total

  def apply_discount
    @discounted_total = discount_service.discount(calculate_total)
  end

  def notify_user
    puts "Sending email to #{user.email}" if user.email

    puts "Sending SMS to #{user.phone}" if user.phone
  end

  def print_order
    puts "Saving order with total #{total}"
  end

  def calculate_total
    total = 0

    @order.items.each do |item|
      total += item.price * item.quantity
    end

    total
  end
end
