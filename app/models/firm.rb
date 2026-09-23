class Firm < ApplicationRecord
  has_many :advisors, dependent: :destroy

  validates :name, presence: true
end