require 'rails_helper'

class MonthValidatable
  include ActiveModel::Validations
  attr_accessor :month
  validates :month, month: true
end

class MonthValidatableWithMessage < MonthValidatable
  validates :month, month: { message: 'not really valid' }
end

RSpec.describe MonthValidator do
  subject { MonthValidatable.new }
  before { subject.month = month }

  context 'when month is nil' do
    let(:month) { nil }

    it { is_expected.to be_invalid }
  end

  context 'when month is 0' do
    let(:month) { 0 }

    it { is_expected.to be_invalid }
  end

  context 'when month is below 0' do
    let(:month) { -1 }

    it { is_expected.to be_invalid }
  end

  context 'when month is above 12' do
    let(:month) { 14 }

    it { is_expected.to be_invalid }
  end

  context 'when month is 7' do
    let(:month) { 7 }

    it { is_expected.to be_valid }
  end

  context 'when month is invalid' do
    let(:month) { -5 }

    it { is_expected.to be_invalid }

    context 'with error message passed' do
      subject { MonthValidatableWithMessage.new }

      it 'appends passed message to record' do
        subject.validate
        expect(subject.errors[:month]).to include('not really valid')
      end
    end

    context 'without error message passed' do
      it 'appends i18n message to record' do
        subject.validate
        expect(subject.errors[:month]).to include('must be valid month number')
      end
    end
  end
end
