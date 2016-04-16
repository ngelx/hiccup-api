# encoding: utf-8
# frozen_string_literal: true
json.extract! trip, :id, :name, :organizator, :start_date, :end_date, :start_location, :end_location, :goal, :route,
              :transportation, :comunication, :freak_out, :in_reach_map, :agency, :fees, :stove_fuel,
              :transportation_time, :direction_out, :condition_caution, :animal_caution, :plant_caution,
              :fly_issue, :supermarket, :outdoor_store

json.contact_name trip.local_contact.name
json.contact_email trip.local_contact.email
json.contact_phone trip.local_contact.phone

json.public_uuid trip.share.public_url
json.private_uuid trip.share.private_url
