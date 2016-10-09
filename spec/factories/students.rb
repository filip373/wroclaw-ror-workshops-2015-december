FactoryGirl.define do
  factory :student do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }

    factory :student_with_birthdate do
      birthdate Date.new(1990, 12, 4)
    end
  end
end
