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

class Intinerary < ActiveRecord::Base
  belongs_to :trip

  validates :trip, presence: true
end
