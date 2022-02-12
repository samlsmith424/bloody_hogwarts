require 'rails_helper'

RSpec.describe "Courses Index Page" do
  it "lists courses and number of students" do
    harry = Student.create!(name: "Harry", age:16, house: "Slytherin")
    herbology = Course.create!(name: "Herbology")
    defense = Course.create!(name: "Defense against the dark arts")
    StudentCourse.create!(student: harry, course: herbology)
    StudentCourse.create!(student: harry, course: defense)

    visit "/courses"
    # save_and_open_page
    expect(page).to have_content(herbology.name)
    expect(page).to have_content(defense.name)
    expect(page).to have_content("Herbology : 1")
    expect(page).to have_content("Defense against the dark arts : 1")
  end
end
