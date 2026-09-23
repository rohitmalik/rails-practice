
require "kafka"
require_relative "config/environment"

kafka = Kafka.new(
  seed_brokers: ["localhost:9092"],
  client_id: "paladin"
)

producer = kafka.producer

appointment = Appointment.create!(
  advisor: Advisor.first,
  client: Client.first,
  appointment_date: Time.current
)

event = {
  id: "123",
  event: "appointment_created",
  timestamp: Time.now,
  client_id: 25,
  appointment_id: appointment.id,
  appointment_date: appointment.appointment_date,
  key: "appointment_created_#{appointment.id}"
}

producer.produce(
  event.to_json,
  topic: "appointments",
  key: event[:key],
  partition: 0
)



producer.deliver_messages


consumer = kafka.consumer(
  group_id: "appointment-notifications"
)

consumer.subscribe("appointments")

puts "Consumer started..."

consumer.each_message do |message|
  puts "Received message:"
  puts message.value
end

puts "Message Is Good  wait published successfully!"
