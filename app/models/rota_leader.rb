class RotaLeader < ActiveRecord::Base
  belongs_to :leader
  belongs_to :job
  belongs_to :meet

  # validates_uniqueness_of :leader_id, scope: :meet_id
  scope :has_leader, -> { where('leader_id is not null') }
  scope :filter_leader, ->(leader) { where('leader_id = ?', leader) }

  scope :by_leader, -> { joins(:leader).merge(Leader.in_order) }
end
