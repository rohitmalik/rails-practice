class DemoJob
  include Sidekiq::Job

  puts "START"

sleep 10

puts "END"
end