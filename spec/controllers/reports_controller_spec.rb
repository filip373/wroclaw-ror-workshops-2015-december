require 'rails_helper'

RSpec.describe ReportsController do
  let(:user) { create :user }

  before { sign_in user }

  describe 'GET #subjects' do
    subject { get :subjects }

    it_behaves_like 'template rendering action', :subjects
  end

  describe 'GET #payments' do
    subject { get :payments }

    it_behaves_like 'template rendering action', :payments
  end

  describe 'GET #payments as json' do
    subject { get :payments, format: :json }

    it_behaves_like 'template rendering action', :payments
  end
end
