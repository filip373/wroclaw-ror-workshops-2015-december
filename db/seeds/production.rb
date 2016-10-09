TEACHER_TITLES = %w(Dr. Prof. TA)
NAMES = %w(John Peter Andrew Robert Mike Anthony)
LAST_NAMES = %w(Smith Thompson Adams Anderson Carl Cooper)

3.times do
  Teacher.create!(
    first_name: NAMES.sample,
    last_name: LAST_NAMES.sample,
    academic_title: TEACHER_TITLES.sample
  )
end

teachers = Teacher.all
['Daily routine', 'Sports', 'Means of transport',
 'Work experience', 'Countries'].each do |title|
  SubjectItem.create!(
    title: title,
    teacher: teachers.sample
  )
end

25.times do
  Student.create!(
    first_name: NAMES.sample,
    last_name: LAST_NAMES.sample
  )
end

students = Student.all
students.sample(rand(15..20)).each do |student|
  student.update(birthdate: rand(7..17).years.ago)
end

SubjectItem.all.each do |subject_item|
  subject_item.students << students.sample(rand(1..4))
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
