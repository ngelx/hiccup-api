json.set! :shares do
  json.extract! @share, :id, :private_url, :trip_id
end

json.set! :trip do
  json.array! [@trip] do |trip|
    json.partial! 'trips/trip', trip: trip
  end
end

json.intineraries @trip.intineraries
