require 'rails_helper'

RSpec.describe Payment do
  describe 'validations' do
    it { is_expected.to validate_presence_of :student_id }
    it { is_expected.to validate_presence_of :subject_item_id }
    it { is_expected.to validate_presence_of :payment_date }
    it { is_expected.to validate_presence_of :month }
    it { is_expected.to validate_presence_of :year }

    context 'when set of the student-subject-month-year is not unique' do
      subject { build(:payment, payment.attributes) }
      let(:payment) { create :payment }

      it { is_expected.to be_invalid }
    end

    context 'when payment date is in the future' do
      subject { build(:payment, payment_date: 5.days.since) }

      it { is_expected.to be_invalid }
    end

    context 'when month number is invalid' do
      subject { build(:payment, month: 0) }

      it { is_expected.to be_invalid }
    end
  end

  describe 'database columns' do
    it { should have_db_column :student_id }
    it { should have_db_column :subject_item_id }
    it { should have_db_column :payment_date }
    it { should have_db_column :month }
    it { should have_db_column :year }
  end

  describe 'associations' do
    it { is_expected.to belong_to :student }
    it { is_expected.to belong_to :subject_item }
  end
end
