TEACHER_TITLES = %w(Dr. Prof. TA)
User.create!(email: 'admin@admin.com',password: 'adminadmin')

3.times do
  Teacher.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    academic_title: TEACHER_TITLES.sample
  )
end

teachers = Teacher.all
5.times do
  SubjectItem.create!(
    title: Faker::Lorem.sentence,
    teacher: teachers.sample
  )
end

25.times do
  Student.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end

students = Student.all
students.sample(rand(15..20)).each do |student|
  student.update(birthdate: Faker::Date.between(16.years.ago, 7.years.ago))
end

SubjectItem.all.each do |subject_item|
  subject_item.students << students.sample(rand(1..4))
end

students_with_subjects = Student.select { |s| s.subject_items.count > 0 }
students_with_subjects.each do |student|
  student.subject_items.each do |subject_item|
    months_taken = []
    rand(2..6).times do |index|
      month = nil
      loop do
        month = Faker::Date.between(1.year.ago, 2.days.ago)
        break unless months_taken.include?(month.month)
      end
      months_taken << month.month
      student.payments.create!(
        subject_item: subject_item,
        payment_date: Faker::Date.between(month - 1.month, month + 1.month),
        year: month.year,
        month: month.month
      )
    end
  end
end

SubjectItem.all.each do |subject_item|
  subject_item.students.each do |student|
    rand(1..5).times do
      subject_item.subject_item_notes << SubjectItemNote.create(student: student,
                                                                subject_item: subject_item,
                                                                value: rand(1..6))
    end
  end
end
