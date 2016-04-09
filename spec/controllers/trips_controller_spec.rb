# encoding: utf-8
# frozen_string_literal: true
require 'rails_helper'
require 'support/render_views'

RSpec.describe TripsController, type: :controller do
  describe 'GET index' do
    let!(:trips) { create_list(:trip, 3, user: nil) }

    context 'unscope' do
      before { get :index }

      it { expect(response).to have_http_status(:success) }
      it { expect(response.headers['Content-Type']).to eq 'application/json; charset=utf-8' }
      context 'Content' do
        subject(:r) { JSON.parse(response.body, symbolize_names: true) }
        its(:length) { should be 3 }
        it { expect(r.first[:id]).to be trips.first.id }
        it { expect(r.last[:id]).to be trips.last.id }
      end
    end

    context 'paginated' do
      before { get :index, page: 1, per_page: 2 }

      it { expect(response).to have_http_status(:success) }
      it { expect(response.headers['Content-Type']).to eq 'application/json; charset=utf-8' }
      context 'Content' do
        subject(:r) { JSON.parse(response.body, symbolize_names: true) }
        its(:length) { should be 2 }
        it { expect(r.first[:id]).to be trips.first.id }
        it { expect(r.last[:id]).to be trips.second.id }
      end
    end
  end

  describe 'POST create' do
    context 'Success' do
      let(:attrs) do
        attributes_for(:trip,
                       name: 'Trip test',
                       start_date: DateTime.current,
                       end_date: DateTime.current + 2,
                       local_contact_attributes: attributes_for(:local_contact))
      end

      before { post :create, trip: attrs }

      it { expect(response).to have_http_status(:success) }
      it { expect(response.headers['Content-Type']).to eq 'application/json; charset=utf-8' }
      context 'Content' do
        subject(:r) { JSON.parse(response.body, symbolize_names: true) }

        it {expect(r[:id]).not_to be nil }
        it { expect(r[:name]).to eq 'Trip test' }
        it { expect(r.key?(:intineraries)).to be true }
        it { expect(r[:intineraries].length).to eq 2 }
        it { expect(r.key?(:share)).to be true }
        it { expect(r[:share]).to be_truthy }
        it { expect(r.key?(:local_contact)).to be true }
        it { expect(r[:local_contact]).to be_truthy }
        it { expect(r[:update_token]).to be_truthy }
      end
    end
  end
end
