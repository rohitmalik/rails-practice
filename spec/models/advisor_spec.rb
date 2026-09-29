require "rails_helper"

RSpec.describe Advisor, type: :model do
  let(:firm) { Firm.first }

  describe "validations" do
    it "is invalid without a name" do
      advisor = Advisor.new(
        firm: firm,
        email: "test@example.com"
      )

      expect(advisor).not_to be_valid
      expect(advisor.errors[:name]).to include("can't be blank")
    end

    it "is invalid without an email" do
      advisor = Advisor.new(
        firm: firm,
        name: "Test Advisor"
      )

      expect(advisor).not_to be_valid
      expect(advisor.errors[:email]).to include("Wrong message")
    end
  end
end
