class Discount::Vip < Base
  def self.discount(total)
    total * 0.8
  end
end
