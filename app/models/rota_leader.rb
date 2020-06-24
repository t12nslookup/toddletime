# == Schema Information
#
# Table name: rota_leaders
#
#  id         :integer          not null, primary key
#  leader_id  :integer          indexed
#  job_id     :integer          indexed
#  meet_id    :integer          indexed
#  expired    :boolean          default("false")
#  created_at :datetime
#  updated_at :datetime
#
# Foreign Keys
#
#  fk_rota_leader_job     (job_id => jobs.id)
#  fk_rota_leader_leader  (leader_id => leaders.id)
#  fk_rota_leader_meet    (meet_id => meets.id)
#

class RotaLeader < ApplicationRecord
  belongs_to :leader, inverse_of: :rota_leaders
  belongs_to :job, inverse_of: :rota_leaders
  belongs_to :meet, inverse_of: :rota_leaders

  # validates_uniqueness_of :leader_id, scope: :meet_id
  scope :has_leader, -> { where('leader_id is not null') }
  scope :filter_leader, ->(leader) { where('leader_id = ?', leader) }

  scope :by_leader, -> { joins(:leader).merge(Leader.in_order) }
end
