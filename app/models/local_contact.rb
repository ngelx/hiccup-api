# encoding: utf-8
# frozen_string_literal: true
class LocalContact < ActiveRecord::Base
  belongs_to :trip

  validates :name, :trip, presence: true
end
