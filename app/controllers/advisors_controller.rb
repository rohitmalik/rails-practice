class AdvisorsController < ApplicationController
  before_action :set_advisor, only: %i[ show edit update destroy ]
   #before_action :authenticate_user!

  # GET /advisors or /advisors.json
  def index
#     puts "nottttttttttttttttttttttt"
#     certification = Certification.first
#     certification.advisors.each do |advisor|
#   puts advisor.firm.name
# end
# puts "Fn+1111111111111"
# certification.advisors.includes(:firm).each do |advisor|
#   puts advisor.firm.name
# end
# puts "Fetching advisors with certifications..."
    @advisors = Advisor.all
      render json: @advisors
  end

  # GET /advisors/1 or /advisors/1.json
  def show
  end

  # GET /advisors/new
  def new
    @advisor = Advisor.new
  end

  # GET /advisors/1/edit
  def edit
  end

  # POST /advisors or /advisors.json
  def create
    @advisor = Advisor.new(advisor_params)

    respond_to do |format|
      if @advisor.save
        format.html { redirect_to @advisor, notice: "Advisor was successfully created." }
        format.json { render :show, status: :created, location: @advisor }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @advisor.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /advisors/1 or /advisors/1.json
  def update
    respond_to do |format|
      if @advisor.update(advisor_params)
        format.html { redirect_to @advisor, notice: "Advisor was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @advisor }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @advisor.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /advisors/1 or /advisors/1.json
  def destroy
    @advisor.destroy!

    respond_to do |format|
      format.html { redirect_to advisors_path, notice: "Advisor was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advisor
      @advisor = Advisor.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def advisor_params
      params.expect(advisor: [ :name, :email, :phone, :firm_id ])
    end
end
