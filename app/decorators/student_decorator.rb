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

  def birthdate_formatted
    return I18n.t('shared.blank') if birthdate.nil?
    birthdate.strftime('%Y-%m_%d')
  end
end
