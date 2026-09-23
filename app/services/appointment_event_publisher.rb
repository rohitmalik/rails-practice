require "json"
class AppointmentEventPublisher
  TOPIC = "appointments"

  def initialize
    @kafka = Kafka.new(
      seed_brokers: [
        ENV.fetch("KAFKA_BROKERS", "localhost:9092")
      ],
      client_id: "paladin"
    )

    @producer = @kafka.producer
  end

  def appointment_created(appointment)
    event = {
      event: "appointment_created",
      appointment_id: appointment.id,
      client_id: appointment.client_id
    }

    @producer.produce(
      event.to_json,
      topic: TOPIC,
      key: appointment.id.to_s
    )

    @producer.deliver_messages
  end
end