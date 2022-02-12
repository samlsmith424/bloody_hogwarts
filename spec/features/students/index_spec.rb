require 'rails_helper'
RSpec.describe "Students index page" do
  it "lists students and their attributes" do
    student = Student.create!(name: "Harry", age:16, house: "Slytherin")
    visit "/students"
    expect(page).to have_content(student.name)
    expect(page).to have_content(student.age)
    expect(page).to have_content(student.house)
  end

  it "has the average age of students" do
    student = Student.create!(name: "Harry", age:16, house: "Slytherin")
    student2 = Student.create!(name: "Fred", age:16, house: "Slytherin")
    student3 = Student.create!(name: "Ron", age:17, house: "Slytherin")

    visit "/students"

    expect(page).to have_content("Average Age: 16.3")
  end

  it "lists students and their attributes" do
    student = Student.create!(name: "Harry", age:16, house: "Slytherin")
    student2 = Student.create!(name: "Fred", age:16, house: "Slytherin")
    student3 = Student.create!(name: "Ron", age:17, house: "Slytherin")

    visit "/students"
    expect("Fred").to appear_before("Harry")
    # expect(student2.name).to appear_before(student.name)
    # expect(student.name).to appear_before(student3.name)
    # expect(student1.name).to_not appear_before(student2.name)
  end
end
