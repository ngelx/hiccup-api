# encoding: utf-8
# frozen_string_literal: true
class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name, null: false
      t.string :organizator
      t.datetime :start_date, null: false
      t.datetime :end_date, null: false
      t.string :start_location
      t.string :end_location
      t.text :goal
      t.string :route
      t.string :transportation
      t.string :comunication
      t.string :freak_out
      t.string :in_reach_map
      t.string :agency
      t.string :fees
      t.string :stove_fuel
      t.string :transportation_time
      t.text :direction_out
      t.text :condition_caution
      t.text :animal_caution
      t.text :plant_caution
      t.text :fly_issue
      t.string :supermarket
      t.string :outdoor_store

      t.timestamps
    end
  end
end
