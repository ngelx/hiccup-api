# encoding: utf-8
# frozen_string_literal: true
json.set! :trip do
  json.array! [@trip] do |trip|
    json.partial! 'trip', trip: trip
  end
end

json.shares [@trip.share]

#json.update_token @trip.update_token

json.intineraries @trip.intineraries
