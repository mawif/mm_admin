require "application_system_test_case"

class StudentApplicationsTest < ApplicationSystemTestCase
  setup do
    @student_application = student_applications(:one)
  end

  test "visiting the index" do
    visit student_applications_url
    assert_selector "h1", text: "Student applications"
  end

  test "should create student application" do
    visit student_applications_url
    click_on "New student application"

    fill_in "Campaign", with: @student_application.campaign_id
    fill_in "Email", with: @student_application.email
    fill_in "Name", with: @student_application.name
    fill_in "Question1", with: @student_application.question1
    fill_in "Question2", with: @student_application.question2
    fill_in "Question3", with: @student_application.question3
    fill_in "Question4", with: @student_application.question4
    fill_in "Question5", with: @student_application.question5
    click_on "Create Student application"

    assert_text "Student application was successfully created"
    click_on "Back"
  end

  test "should update Student application" do
    visit student_application_url(@student_application)
    click_on "Edit this student application", match: :first

    fill_in "Campaign", with: @student_application.campaign_id
    fill_in "Email", with: @student_application.email
    fill_in "Name", with: @student_application.name
    fill_in "Question1", with: @student_application.question1
    fill_in "Question2", with: @student_application.question2
    fill_in "Question3", with: @student_application.question3
    fill_in "Question4", with: @student_application.question4
    fill_in "Question5", with: @student_application.question5
    click_on "Update Student application"

    assert_text "Student application was successfully updated"
    click_on "Back"
  end

  test "should destroy Student application" do
    visit student_application_url(@student_application)
    click_on "Destroy this student application", match: :first

    assert_text "Student application was successfully destroyed"
  end
end
