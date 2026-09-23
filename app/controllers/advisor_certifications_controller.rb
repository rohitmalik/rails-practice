class AdvisorCertificationsController < ApplicationController
  before_action :set_advisor_certification, only: %i[ show edit update destroy ]

  # GET /advisor_certifications or /advisor_certifications.json
  def index
    @advisor_certifications = AdvisorCertification.all
  end

  # GET /advisor_certifications/1 or /advisor_certifications/1.json
  def show
  end

  # GET /advisor_certifications/new
  def new
    @advisor_certification = AdvisorCertification.new
  end

  # GET /advisor_certifications/1/edit
  def edit
  end

  # POST /advisor_certifications or /advisor_certifications.json
  def create
    @advisor_certification = AdvisorCertification.new(advisor_certification_params)

    respond_to do |format|
      if @advisor_certification.save
        format.html { redirect_to @advisor_certification, notice: "Advisor certification was successfully created." }
        format.json { render :show, status: :created, location: @advisor_certification }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @advisor_certification.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /advisor_certifications/1 or /advisor_certifications/1.json
  def update
    respond_to do |format|
      if @advisor_certification.update(advisor_certification_params)
        format.html { redirect_to @advisor_certification, notice: "Advisor certification was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @advisor_certification }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @advisor_certification.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /advisor_certifications/1 or /advisor_certifications/1.json
  def destroy
    @advisor_certification.destroy!

    respond_to do |format|
      format.html { redirect_to advisor_certifications_path, notice: "Advisor certification was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advisor_certification
      @advisor_certification = AdvisorCertification.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def advisor_certification_params
      params.expect(advisor_certification: [ :advisor_id, :certification_id, :issued_at ])
    end
end
