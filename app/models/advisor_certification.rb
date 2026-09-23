class AdvisorCertification < ApplicationRecord
  belongs_to :advisor
  belongs_to :certification

  validates :issued_at, presence: true
end