class AppointmentNotificationJob
  include Sidekiq::Job

  sidekiq_options retry: 3

  def perform(appointment_id)
    puts "Running job..."

    raise "Notification API failed"
  end
end