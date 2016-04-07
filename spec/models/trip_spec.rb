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
#

require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe 'Validations' do
    subject(:trip) { build(:trip) }
    it { should be_valid }

    context 'invalids' do
      it { expect(build(:trip, name: nil)).to_not be_valid }
      it { expect(build(:trip, start_date: nil)).to_not be_valid }
      it { expect(build(:trip, end_date: nil)).to_not be_valid }
    end
  end
end
