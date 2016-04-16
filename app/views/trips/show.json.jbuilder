# encoding: utf-8
# frozen_string_literal: true
json.set! :trip do
  json.partial! 'trip', trip: @trip
end

json.set! :share do
  json.share @trip.share
end

json.set! :intineraries do
  json.intineraries @trip.intineraries
end
