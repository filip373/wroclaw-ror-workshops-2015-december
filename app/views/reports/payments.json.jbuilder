json.data do
  json.array! payments do |payment|
    json.array! [
      payment.student.decorate.full_name,
      payment.subject_item.title,
      payment.full_month,
      payment.payment_date
    ]
  end
end
