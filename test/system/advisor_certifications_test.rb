require "application_system_test_case"

class AdvisorCertificationsTest < ApplicationSystemTestCase
  setup do
    @advisor_certification = advisor_certifications(:one)
  end

  test "visiting the index" do
    visit advisor_certifications_url
    assert_selector "h1", text: "Advisor certifications"
  end

  test "should create advisor certification" do
    visit advisor_certifications_url
    click_on "New advisor certification"

    fill_in "Advisor", with: @advisor_certification.advisor_id
    fill_in "Certification", with: @advisor_certification.certification_id
    fill_in "Issued at", with: @advisor_certification.issued_at
    click_on "Create Advisor certification"

    assert_text "Advisor certification was successfully created"
    click_on "Back"
  end

  test "should update Advisor certification" do
    visit advisor_certification_url(@advisor_certification)
    click_on "Edit this advisor certification", match: :first

    fill_in "Advisor", with: @advisor_certification.advisor_id
    fill_in "Certification", with: @advisor_certification.certification_id
    fill_in "Issued at", with: @advisor_certification.issued_at
    click_on "Update Advisor certification"

    assert_text "Advisor certification was successfully updated"
    click_on "Back"
  end

  test "should destroy Advisor certification" do
    visit advisor_certification_url(@advisor_certification)
    click_on "Destroy this advisor certification", match: :first

    assert_text "Advisor certification was successfully destroyed"
  end
end
