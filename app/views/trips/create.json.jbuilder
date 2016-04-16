# encoding: utf-8
# frozen_string_literal: true
json.set! :trip do
  json.partial! 'trip', trip: @trip
end

json.share @trip.share


json.update_token @trip.update_token

json.intineraries @trip.intineraries
