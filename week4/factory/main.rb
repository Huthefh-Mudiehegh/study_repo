## PROBLEM ##

# class NotificationSender
#   def initialize(type, message)
#     @type = type
#     @message = message
#   end

#   def send_notification
#     notifier =
#       if @type == "email"
#         EmailNotifier.new
#       elsif @type == "sms"
#         SmsNotifier.new
#       elsif @type == "push"
#         PushNotifier.new
#       else
#         raise "Unknown type"
#       end

#     notifier.send(@message)
#   end
# end


# class EmailNotifier
#   def send(message)
#     puts "📧 Email: #{message}"
#   end
# end

# class SmsNotifier
#   def send(message)
#     puts "📱 SMS: #{message}"
#   end
# end

# class PushNotifier
#   def send(message)
#     puts "🔔 Push: #{message}"
#   end
# end

# Refactored Code ##

class NotificationSender
  def initialize(type, message)
    @type = type
    @message = message
    @notifier = NotificationFactory.create(@type)
  end

  def send_notification
    @notifier.send(@message)
  end
end

def NotificationFactory
  def self.create(type)
    "#{type.capitalize}Notifier".constantize.new
  rescue NameError
    raise 'Unknown Notifier'
  end
end

class EmailNotifier
  def send(message)
    puts "📧 Email: #{message}"
  end
end

class SmsNotifier
  def send(message)
    puts "📱 SMS: #{message}"
  end
end

class PushNotifier
  def send(message)
    puts "🔔 Push: #{message}"
  end
end
