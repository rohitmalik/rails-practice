puts "Cleaning database..."

Appointment.delete_all
AdvisorCertification.delete_all
Certification.delete_all
Client.delete_all
Advisor.delete_all
Firm.delete_all

puts "Creating firms..."

firm1 = Firm.create!(
  name: "Paladin Financial Advisors",
  website: "https://example.com",
  city: "New York"
)

firm2 = Firm.create!(
  name: "Wealth Planning Group",
  website: "https://example.com",
  city: "Chicago"
)

puts "Creating advisors..."

advisors = []

5.times do |i|
  advisors << Advisor.create!(
    name: "Advisor #{i + 1}",
    email: "advisor#{i + 1}@example.com",
    phone: "999999999#{i}",
    firm: i.even? ? firm1 : firm2
  )
end

puts "Creating clients..."

clients = []

20.times do |i|
  clients << Client.create!(
    name: "Client #{i + 1}",
    email: "client#{i + 1}@example.com",
    phone: "888888888#{i}",
    advisor: advisors[i % advisors.length]
  )
end

puts "Creating certifications..."

cfp = Certification.create!(
  name: "CFP",
  issuing_organization: "CFP Board"
)

cfa = Certification.create!(
  name: "CFA",
  issuing_organization: "CFA Institute"
)

finra = Certification.create!(
  name: "FINRA",
  issuing_organization: "FINRA"
)

puts "Assigning certifications..."

advisors.each_with_index do |advisor, index|

  advisor.advisor_certifications.create!(
    certification: cfp,
    issued_at: Date.current - 3.years
  )

  if index.even?
    advisor.advisor_certifications.create!(
      certification: cfa,
      issued_at: Date.current - 2.years
    )
  else
    advisor.advisor_certifications.create!(
      certification: finra,
      issued_at: Date.current - 1.year
    )
  end

end

puts "Creating appointments..."

clients.each_with_index do |client, index|
  Appointment.create!(
    advisor: client.advisor,
    client: client,
    appointment_date: Time.current + index.days,
    status: index.even? ? "scheduled" : "completed",
    notes: "Financial planning discussion"
  )
end

puts "Seed completed!"