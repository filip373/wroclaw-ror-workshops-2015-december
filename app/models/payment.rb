class Payment < ActiveRecord::Base
  belongs_to :subject_item
  belongs_to :student

  validates :student_id, :subject_item_id, :payment_date,
    :month, :year, presence: true
  validates :student, uniqueness: { scope: [:subject_item, :month, :year] }
  validates :payment_date, past_date: true
  validates :month, month: true
end
