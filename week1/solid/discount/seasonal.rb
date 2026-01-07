class Discount::Seasonal < Base
  def self.discount(total)
    total * 0.9
  end
end
