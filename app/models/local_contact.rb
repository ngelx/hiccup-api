class LocalContact < ActiveRecord::Base
  belongs_to :trip
  
  validates :name, :trip, presence: true
end
