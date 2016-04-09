# encoding: utf-8
# frozen_string_literal: true
json.extract! @trip, :id, :name, :organizator, :start_date, :end_date, :start_location, :end_location, :goal, :route,
              :transportation, :comunication, :freak_out, :in_reach_map, :agency, :fees, :stove_fuel,
              :transportation_time, :direction_out, :condition_caution, :animal_caution, :plant_caution,
              :fly_issue, :supermarket, :outdoor_store

json.intineraries @trip.intineraries

json.local_contact @trip.local_contact
