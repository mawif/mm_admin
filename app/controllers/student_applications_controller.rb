require "csv"

class StudentApplicationsController < ApplicationController
  before_action :get_campaign
  before_action :set_student_application, only: %i[ show edit update destroy ]

  # GET /student_applications
  def index
    @student_applications = @campaign.student_applications
  end

  # GET /student_applications/1
  def show
  end

  # GET /student_applications/new
  def new
    @student_application = @campaign.student_applications.build
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

  def import
    return redirect_to request.referer, notice: "No file added" if params[:file].nil?
    redirect_to request.referer, notice: "Only CSV files allowed" unless params[:file].content_type == "text/csv"

    import_csv(params[:file], @campaign.id)

    redirect_to request.referer, notice: "Import started..."
  end

  # PATCH/PUT /student_applications/1
  def update
    if @student_application.update(student_application_params)
      redirect_to [ @campaign, @student_application ], notice: "Student application was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /student_applications/1
  def destroy
    @student_application.destroy!
    redirect_to campaign_student_applications_url, notice: "Student application was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_application
      @student_application = @campaign.student_applications.find(params[:id])
    end

    def get_campaign
      @campaign = Campaign.find(params[:campaign_id])
    end

    # Only allow a list of trusted parameters through.
    def student_application_params
      params.require(:student_application).permit(:name, :email, :question1, :question2, :question3, :question4, :question5, :campaign_id)
    end

    def import_csv(file, campaign_id)
      opened_file = File.open(file)
      options = { headers: true }
      CSV.foreach(opened_file, **options) do |row|
        # map the CSV columns to your database columns
        app_hash = {}
        app_hash[:name] = row["name"]
        app_hash[:email] = row["email"]
        app_hash[:question1] = row["question1"]
        app_hash[:question2] = row["question2"]
        app_hash[:question3] = row["question3"]
        app_hash[:question4] = row["question4"]
        app_hash[:question5] = row["question5"]
        app_hash[:campaign_id] = campaign_id

        StudentApplication.find_or_create_by!(app_hash)
      end
    end
end
