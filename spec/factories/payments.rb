FactoryGirl.define do
  factory :payment do
    subject_item
    student
    payment_date 5.days.ago
    month 5
    year 2015
  end
end
