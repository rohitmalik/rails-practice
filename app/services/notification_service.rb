class NotificationService
  def self.call(appointment)
    client = appointment.client

    puts "Sending notification to #{client.email}"
  end
end