class ChildToMeet < ActiveRecord::Base
  belongs_to :child
  belongs_to :meet

  validates_uniqueness_of :meet_id, scope: :child_id
end
