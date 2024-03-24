class StudentApplicationsController < ApplicationController
  before_action :set_student_application, only: %i[ show edit update destroy ]

  # GET /student_applications
  def index
    @student_applications = StudentApplication.all
  end

  # GET /student_applications/1
  def show
  end

  # GET /student_applications/new
  def new
    @student_application = StudentApplication.new
  end

  # GET /student_applications/1/edit
  def edit
  end

  # POST /student_applications
  def create
    @student_application = StudentApplication.new(student_application_params)

    if @student_application.save
      redirect_to @student_application, notice: "Student application was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /student_applications/1
  def update
    if @student_application.update(student_application_params)
      redirect_to @student_application, notice: "Student application was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /student_applications/1
  def destroy
    @student_application.destroy!
    redirect_to student_applications_url, notice: "Student application was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_application
      @student_application = StudentApplication.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_application_params
      params.require(:student_application).permit(:name, :email, :question1, :question2, :question3, :question4, :question5, :campaign_id)
    end
end
