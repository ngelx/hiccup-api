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
    let(:attrs) do
      attributes_for(:trip,
                     name: 'Trip test',
                     start_date: DateTime.current,
                     end_date: DateTime.current + 2,
                     local_contact_attributes: attributes_for(:local_contact))
    end

    context 'Success' do
      before { post :create, trip: attrs }

      it { expect(response).to have_http_status(:success) }
      it { expect(response.headers['Content-Type']).to eq 'application/json; charset=utf-8' }
      it { expect(response).to render_template(:create) }

      context 'Content' do
        subject(:r) { JSON.parse(response.body, symbolize_names: true) }

        it { expect(r[:id]).not_to be nil }
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
    context 'Error' do
      it 'No argumnet' do
        post :create, trip: nil
        expect(response).to have_http_status(400)
      end
      it 'bad argument, no name' do
        attrs.delete(:name)
        post :create, trip: attrs
        expect(response).to have_http_status(422)
      end
      it 'bad argument, no start_date' do
        attrs.delete(:start_date)
        post :create, trip: attrs
        expect(response).to have_http_status(422)
      end
      it 'bad argument, no end_date' do
        attrs.delete(:end_date)
        post :create, trip: attrs
        expect(response).to have_http_status(422)
      end
      it 'internal server error' do
        allow_any_instance_of(Trip).to receive(:save).and_raise
        post :create, trip: attrs
        expect(response).to have_http_status(500)
      end
    end
  end

  describe 'PATCH update' do
    let(:attrs) do
      attributes_for(:trip,
                     name: 'Trip updated',
                     start_date: DateTime.current,
                     end_date: DateTime.current + 2,
                     local_contact_attributes: attributes_for(:local_contact))
    end

    context 'Success' do
      before do
        trip = create(:trip, name: 'Original Trip')
        patch :update, id: trip.id, update_token: trip.update_token, trip: attrs
      end

      it { expect(response).to have_http_status(:success) }
      it { expect(response.headers['Content-Type']).to eq 'application/json; charset=utf-8' }
      it { expect(response).to render_template(:create) }
      it { expect(JSON.parse(response.body, symbolize_names: true)[:name]).to eq 'Trip updated' }
    end
    context 'Error' do
      let(:trip) { create(:trip, name: 'Original Trip') }

      it 'missing trip argument' do
        patch :update, id: trip.id, update_token: trip.update_token
        expect(response).to have_http_status(400)
      end
      it 'missing update_token argument' do
        patch :update, trip: attrs, id: trip.id
        expect(response).to have_http_status(400)
      end
      context 'bad update_token' do
        before { patch :update, id: trip.id, update_token: 'bad-token', trip: attrs }

        it { expect(response).to have_http_status(:not_found) }
        it { expect(JSON.parse(response.body, symbolize_names: true)[:error]).to eq 'Couldn\'t find Trip' }
      end
    end
  end

  describe 'GET show' do
    let!(:trip) { create(:trip_complete_for_integration, name: 'Show trip test', user: nil) }

    context 'Success' do
      before { get :show, id: trip.share.public_url }

      it { expect(response).to have_http_status(:success) }
      it { expect(response.headers['Content-Type']).to eq 'application/json; charset=utf-8' }
      it { expect(response).to render_template(:show) }

      context 'Content' do
        subject(:r) { JSON.parse(response.body, symbolize_names: true) }

        it { expect(r[:id]).to eq trip.id }
        it { expect(r[:name]).to eq trip.name }
        it { expect(r[:intineraries].length).to eq 2 }
        it { expect(r.key?(:share)).to be_falsey }
        it { expect(r.key?(:local_contact)).to be true }
        it { expect(r[:local_contact]).to be_truthy }
        it { expect(r[:update_token]).to be_falsey }
      end
    end
    context 'Error' do
      before { get :show, id: 'not-a-valid-id' }

      it { expect(response).to have_http_status(:not_found) }
      it { expect(JSON.parse(response.body, symbolize_names: true)[:error]).to eq 'Couldn\'t find Share' }
    end
  end
end
