json.set! :intinerary do
  json.array! [@intinerary] do |intinerary|
    json.partial! 'intineraries/intinerary', intinerary: intinerary
  end
end
