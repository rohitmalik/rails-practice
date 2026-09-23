require "application_system_test_case"

class CertificationsTest < ApplicationSystemTestCase
  setup do
    @certification = certifications(:one)
  end

  test "visiting the index" do
    visit certifications_url
    assert_selector "h1", text: "Certifications"
  end

  test "should create certification" do
    visit certifications_url
    click_on "New certification"

    fill_in "Issuing organization", with: @certification.issuing_organization
    fill_in "Name", with: @certification.name
    click_on "Create Certification"

    assert_text "Certification was successfully created"
    click_on "Back"
  end

  test "should update Certification" do
    visit certification_url(@certification)
    click_on "Edit this certification", match: :first

    fill_in "Issuing organization", with: @certification.issuing_organization
    fill_in "Name", with: @certification.name
    click_on "Update Certification"

    assert_text "Certification was successfully updated"
    click_on "Back"
  end

  test "should destroy Certification" do
    visit certification_url(@certification)
    click_on "Destroy this certification", match: :first

    assert_text "Certification was successfully destroyed"
  end
end
