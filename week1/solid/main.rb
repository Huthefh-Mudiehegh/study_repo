discount_service = Discount::Vip
order_service = OrderService.new(order, user, discount_service:)
order_service.checkout
