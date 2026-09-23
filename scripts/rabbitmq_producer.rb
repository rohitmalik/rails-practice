require "bunny"
require "json"

connection = Bunny.new(
  "amqp://guest:guest@rabbitmq:5672"
)connection.start

channel = connection.create_channel

exchange = channel.topic("paladin_events")

message = {
  event: "appointment.created",
  appointment_id: 101
}

exchange.publish(
  message.to_json,
  routing_key: "appointment.created"
)

puts "Message published"

connection.close