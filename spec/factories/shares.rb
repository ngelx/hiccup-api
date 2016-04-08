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

FactoryGirl.define do
  factory :share do
    trip
    public_url "public/1"
    private_url "MyString"
    password_encrypted "MyString"
  end
end
