class PaymentDecorator < BaseDecorator
  def full_month
    "#{'%02d' % month}/#{year}"
  end
end
