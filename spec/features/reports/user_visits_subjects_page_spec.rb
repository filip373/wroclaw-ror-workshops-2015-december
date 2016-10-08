require 'spec_helper'

feature 'User visits subjects page'  do
  let!(:student) { create :student, first_name: 'Jan' }
  let!(:teacher) { create :teacher, first_name: 'Adam' }
  let!(:subject) { create :subject_item, title: 'Lesson 1', teacher: teacher }
  let!(:participation) { create :participation, student: student, subject_item: subject }
  let!(:subject_item_note) { create :subject_item_note, student: student, subject_item: subject }

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit report_subjects_path
  end

  scenario 'should see subjects list' do
    within('.breadcrumbs') do
      expect(page).to have_content 'RoR Workhops » Subjects'
    end

    expect(page).to have_content 'Jan'
    expect(page).to have_content 'Adam'
    expect(page).to have_content 'Lesson 1'
  end

  scenario 'only when sign in' do
    logout
    visit report_subjects_path
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end
