# == Schema Information
#
# Table name: shares
#
#  id                 :integer          not null, primary key
#  trip_id            :integer          not null
#  public_url         :string           not null
#  private_url        :string
#  password_encrypted :string
#
# Indexes
#
#  index_shares_on_trip_id  (trip_id)
#

class Share < ActiveRecord::Base
  belongs_to :trip

  validates :trip, :public_url, presence: true
end
