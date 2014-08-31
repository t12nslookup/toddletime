class HowHeard < ActiveRecord::Base
  has_many :carers

  scope :in_order, ->{ order("location_name") }

  validates :location_name, presence: true, uniqueness: true
end
