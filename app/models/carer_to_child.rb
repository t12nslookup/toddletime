class CarerToChild < ActiveRecord::Base
  belongs_to :child
  belongs_to :carer

  validates_uniqueness_of :child_id, scope: :carer_id
end
