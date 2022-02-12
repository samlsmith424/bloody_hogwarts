require 'rails_helper'

RSpec.describe "Students show page" do
  it "lists students courses" do
    student = Student.create!(name: "Harry", age:16, house: "Slytherin")
    herbology = Course.create!(name: "Herbology")
    defense = Course.create!(name: "Defense against the dark arts")
    StudentCourse.create!(student: student, course: herbology)
    StudentCourse.create!(student: student, course: defense)

    visit "/students/#{student.id}"

    expect(page).to have_content("Herbology")
    expect(page).to have_content("Defense against the dark arts")
  end
end
