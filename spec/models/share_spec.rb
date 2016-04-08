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

require 'rails_helper'

RSpec.describe Share, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:public_url) }
    it { should validate_presence_of(:trip) }
    it { should belong_to(:trip) }
  end
end
