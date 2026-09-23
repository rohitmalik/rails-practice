require "bunny"

module Rabbitmq
  class Client
    def self.connection
      @connection ||= Bunny.new(
        "amqp://guest:guest@rabbitmq:5672"
      ).tap(&:start)
    end

    def self.channel
      @channel ||= connection.create_channel
    end
  end
end
