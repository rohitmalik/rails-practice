require "test_helper"

class AdvisorCertificationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @advisor_certification = advisor_certifications(:one)
  end

  test "should get index" do
    get advisor_certifications_url
    assert_response :success
  end

  test "should get new" do
    get new_advisor_certification_url
    assert_response :success
  end

  test "should create advisor_certification" do
    assert_difference("AdvisorCertification.count") do
      post advisor_certifications_url, params: { advisor_certification: { advisor_id: @advisor_certification.advisor_id, certification_id: @advisor_certification.certification_id, issued_at: @advisor_certification.issued_at } }
    end

    assert_redirected_to advisor_certification_url(AdvisorCertification.last)
  end

  test "should show advisor_certification" do
    get advisor_certification_url(@advisor_certification)
    assert_response :success
  end

  test "should get edit" do
    get edit_advisor_certification_url(@advisor_certification)
    assert_response :success
  end

  test "should update advisor_certification" do
    patch advisor_certification_url(@advisor_certification), params: { advisor_certification: { advisor_id: @advisor_certification.advisor_id, certification_id: @advisor_certification.certification_id, issued_at: @advisor_certification.issued_at } }
    assert_redirected_to advisor_certification_url(@advisor_certification)
  end

  test "should destroy advisor_certification" do
    assert_difference("AdvisorCertification.count", -1) do
      delete advisor_certification_url(@advisor_certification)
    end

    assert_redirected_to advisor_certifications_url
  end
end
