require 'rails_helper'

describe PaymentDecorator do
  let(:payment) { build :payment, month: month, year: 2015 }

  describe '#full_month' do
    subject { payment.decorate.full_month }

    context 'when month number equals 7' do
      let(:month) { 7 }
      it { is_expected.to eq '07/2015' }
    end

    context 'when month number equals 10' do
      let(:month) { 10 }
      it { is_expected.to eq '10/2015' }
    end
  end
end
