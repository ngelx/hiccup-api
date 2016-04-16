json.set! :trips do
  json.partial! partial: 'trips/trip', collection: @trips, as: :trip
end
