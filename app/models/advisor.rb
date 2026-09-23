class Advisor < ApplicationRecord
  belongs_to :firm

  has_many :clients, dependent: :destroy
  has_many :appointments, dependent: :destroy

  has_many :advisor_certifications, dependent: :destroy
  has_many :certifications, through: :advisor_certifications

  validates :name, presence: true
  validates :email, presence: true
end