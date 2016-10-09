class MonthValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.nil?
      record.errors.add(attribute, (options[:message] || :blank))
    elsif value < 1 || value > 12
      record.errors.add(attribute, (options[:message] || :invalid_month))
    end
  end
end
