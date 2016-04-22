# encoding: utf-8
# frozen_string_literal: true
json.set! :trip do
  json.partial! 'trips/trip', trip: @trip
end

json.intineraries @trip.intineraries
