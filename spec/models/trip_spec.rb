# encoding: utf-8
# frozen_string_literal: true
# == Schema Information
#
# Table name: trips
#
#  id                  :integer          not null, primary key
#  name                :string           not null
#  organizator         :string
#  start_date          :datetime         not null
#  end_date            :datetime         not null
#  start_location      :string
#  end_location        :string
#  goal                :text
#  route               :string
#  transportation      :string
#  comunication        :string
#  freak_out           :string
#  in_reach_map        :string
#  agency              :string
#  fees                :string
#  stove_fuel          :string
#  transportation_time :string
#  direction_out       :text
#  condition_caution   :text
#  animal_caution      :text
#  plant_caution       :text
#  fly_issue           :text
#  supermarket         :string
#  outdoor_store       :string
#  created_at          :datetime
#  updated_at          :datetime
#  user_id             :integer
#  update_token        :string
#

require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
    it { should have_many(:intineraries) }
    it { should have_one(:local_contact) }
    it { should have_one(:share) }
    it { should belong_to(:user) }
    it { expect(build(:trip, user: nil)).to be_valid }
  end

  describe '.days' do
    subject(:trip) { build(:trip, start_date: DateTime.current, end_date: DateTime.current + 2.days) }
    its(:days) { should eq(2) }
  end

  describe '.auto_create_intineraries' do
    subject(:trip) { create(:trip, start_date: DateTime.current, end_date: DateTime.current + 2.days) }

    it { expect { trip.auto_create_intineraries }.to change { Intinerary.count }.by 2 }
  end

  describe 'update_token' do
    subject(:trip) { create(:trip) }
    its(:update_token) { should_not be_nil }
  end
end
