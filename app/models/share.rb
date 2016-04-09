# encoding: utf-8
# frozen_string_literal: true
# == Schema Information
#
# Table name: shares
#
#  id              :integer          not null, primary key
#  trip_id         :integer          not null
#  public_url      :string           not null
#  private_url     :string
#  password_digest :string
#
# Indexes
#
#  index_shares_on_trip_id  (trip_id)
#

class Share < ActiveRecord::Base
  belongs_to :trip

  has_secure_password(validations: false)

  validates :trip, presence: true

  before_create :generate_urls

  private

  def generate_urls
    self.public_url = SecureRandom.uuid
    self.private_url = SecureRandom.uuid
  end
end
