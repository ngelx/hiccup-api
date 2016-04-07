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

FactoryGirl.define do
  factory :trip do
    name 'MyString'
    organizator 'MyString'
    start_date DateTime.current
    end_date DateTime.current + 2.days
    start_location 'MyString'
    end_location 'MyString'
    goal 'MyText'
    route 'MyString'
    transportation 'MyString'
    comunication 'MyString'
    freak_out 'MyString'
    in_reach_map 'MyString'
    agency 'MyString'
    fees 'MyString'
    stove_fuel 'MyString'
    transportation_time 'MyString'
    direction_out 'MyText'
    condition_caution 'MyText'
    animal_caution 'MyText'
    plant_caution 'MyText'
    fly_issue 'MyText'
    supermarket 'MyString'
    outdoor_store 'MyString'
  end
end
