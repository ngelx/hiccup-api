# == Schema Information
#
# Table name: intineraries
#
#  id             :integer          not null, primary key
#  trip_id        :integer          not null
#  start_location :string
#  end_location   :string
#  start_time     :datetime
#  end_time       :datetime
#  water          :integer
#  hammok         :integer
#  fishing        :boolean
#  forecast       :string
#
# Indexes
#
#  index_intineraries_on_trip_id  (trip_id)
#

FactoryGirl.define do
  factory :intinerary do
    trip
    start_location "MyString"
    end_location "MyString"
    start_time DateTime.current
    end_time DateTime.current + 4.hours
    water 1
    hammok 1
    fishing false
    forecast "MyString"
  end
end
