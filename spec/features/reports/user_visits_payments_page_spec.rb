require 'spec_helper'

feature 'User visits payments page'  do
  let!(:student) { create :student, first_name: 'Jan', birthdate: Date.new(1990, 9, 30) }
  let!(:teacher) { create :teacher }
  let!(:subject) { create :subject_item, title: 'Lesson 1', teacher: teacher }
  let!(:payment) { create :payment, student: student, subject_item: subject,
                   month: 7, year: 2015, payment_date: Date.new(2015, 8, 30) }

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit report_payments_path
  end

  scenario 'should see payments list', js: true do
    within('.breadcrumbs') do
      expect(page).to have_content 'RoR Workhops » Payments'
    end

    expect(page).to have_content 'Jan'
    expect(page).to have_content 'Lesson 1'
    expect(page).to have_content '07/2015'
    expect(page).to have_content '2015-08-30'
  end

  scenario 'only when sign in' do
    logout
    visit report_payments_path
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end
