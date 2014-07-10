class CarerToMeet < ActiveRecord::Base
  belongs_to :carer
  belongs_to :meet

  validates_uniqueness_of :meet_id, scope: :carer_id
end
