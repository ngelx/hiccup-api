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

class Trip < ActiveRecord::Base
  has_many :intineraries
  has_one :local_contact

  validates :name, :start_date, :end_date, presence: true

  def days
    return (self.end_date.to_date - self.start_date.to_date).to_i
  end

  def auto_create_intineraries
    current_date = self.start_date.to_date
    finish_date = self.end_date.to_date
    total_days =finish_date - current_date
    day = 1

    while (day <= self.days) do
      self.intineraries.create()
      current_date + 1.day
      day +=1
    end

  end

end
