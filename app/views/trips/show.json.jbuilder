# encoding: utf-8
# frozen_string_literal: true
json.set! :trip do
  #json.array! [@trip] do |trip|
    json.partial! 'trips/trip', trip: @trip
  #end
end

json.intineraries @trip.intineraries
