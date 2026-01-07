class Discount::Base
  def self.discount(total)
    raise NotImplementedError
  end
end
