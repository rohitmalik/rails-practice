require "bunny"
require "json"

connection = Bunny.new(
  "amqp://guest:guest@rabbitmq:5672"
)

connection.start

channel = connection.create_channel

exchange = channel.topic(
  "paladin_events",
  durable: true
)

queue = channel.queue(
  "appointment_notifications",
  durable: true
)

queue.bind(
  exchange,
  routing_key: "appointment.created"
)

puts "Waiting for messages..."

queue.subscribe(manual_ack: true) do |delivery_info, properties, body|

  event = JSON.parse(body)

  puts "Received event:"
  puts event

  appointment_id = event["appointment_id"]

  puts "Processing appointment #{appointment_id}"

  channel.ack(delivery_info.delivery_tag)
end
