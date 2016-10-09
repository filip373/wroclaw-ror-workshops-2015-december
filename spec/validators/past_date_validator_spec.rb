require 'rails_helper'

class DateValidatable
  include ActiveModel::Validations
  attr_accessor :date
  validates :date, past_date: true
end

class DateValidatableWithMessage < DateValidatable
  validates :date, past_date: { message: 'not really valid' }
end

RSpec.describe PastDateValidator do
  subject { DateValidatable.new }
  before { subject.date = date }

  context 'when date is nil' do
    let(:date) { nil }

    it { is_expected.to be_valid }
  end

  context 'when date is in the past' do
    let(:date) { 5.days.ago.to_date }

    it { is_expected.to be_valid }
  end

  context 'when date is not in the past' do
    let(:date) { 5.days.since.to_date }

    it { is_expected.to be_invalid }

    context 'with error message passed' do
      subject { DateValidatableWithMessage.new }

      it 'appends passed message to record' do
        subject.validate
        expect(subject.errors[:date]).to include('not really valid')
      end
    end

    context 'without error message passed' do
      it 'appends i18n message to record' do
        subject.validate
        expect(subject.errors[:date]).to include('must be in the past')
      end
    end
  end
end
