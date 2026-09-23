class Appointment < ApplicationRecord
  belongs_to :advisor
  belongs_to :client
  has_one :payment
end
