class Certification < ApplicationRecord
  has_many :advisor_certifications, dependent: :destroy
  has_many :advisors, through: :advisor_certifications

  validates :name, presence: true
end