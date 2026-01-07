class Discount::Coupon < Base
  def self.discount(total)
    total - 20
  end
end
