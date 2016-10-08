class StudentDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def avg_notes(subject_item)
    notes = object.subject_item_notes
      .where(subject_item: subject_item).pluck(:value)
    avg = notes.count > 0 ? notes.sum.to_f / notes.count : 0
    '%.2f' % avg
  end
end
