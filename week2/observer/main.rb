# class Order
#   attr_reader :status, :user_email, :user_phone

#   def initialize(user_email, user_phone)
#     @user_email = user_email
#     @user_phone = user_phone
#     @status = "pending"
#   end

#   def confirm!
#     @status = "confirmed"

#     # Direct side effects — tightly coupled
#     send_email
#     send_sms
#     update_dashboard
#   end

#   private

#   def send_email
#     puts "Email sent to #{@user_email}"
#   end

#   def send_sms
#     puts "SMS sent to #{@user_phone}"
#   end

#   def update_dashboard
#     puts "Dashboard updated"
#   end
# end

class Order
  attr_accessor :status
  attr_reader :user_email, :user_phone

  def initialize(user_email, user_phone)
    @user_email = user_email
    @user_phone = user_phone
    @status = 'pending'
  end
end

class OrderObservable
  attr_reader :order

  def initialize(order)
    @order = order
    @observers = []
  end

  def confirm!
    @order.status = 'confirmed'
    notify
  end

  def add(observer)
    @observers << observer
  end

  def remove(observer)
    @observers.delete(observer)
  end

  def notify
    @observers.each(&:update)
  end
end

class OrderObserver
  def initialize(observable)
    @observable = observable
  end

  def update
    raise NotImplementedError
  end

  private

  attr_reader :observable
end

class EmailObserver < OrderObserver
  def update
    puts "Email sent to #{observable.order.user_email}"
  end
end

class SmsObserver < OrderObserver
  def update
    puts "SMS sent to #{observable.order.user_phone}"
  end
end

class DashboardObserver < OrderObserver
  def update
    puts 'Dashboard updated'
  end
end

# Usage
order = Order.new('huthaifa@gmail.com', '777666555')
observable = OrderObservable.new(order)

observable.add(EmailObserver.new(observable))
observable.add(SmsObserver.new(observable))
observable.add(DashboardObserver.new(observable))

observable.confirm!
