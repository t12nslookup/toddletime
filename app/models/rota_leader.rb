# frozen_string_literal: true

# == Schema Information
#
# Table name: rota_leaders
#
#  id         :bigint           not null, primary key
#  expired    :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  job_id     :bigint           indexed
#  leader_id  :bigint           indexed
#  meet_id    :bigint           indexed
#
# Indexes
#
#  index_rota_leaders_on_job_id     (job_id)
#  index_rota_leaders_on_leader_id  (leader_id)
#  index_rota_leaders_on_meet_id    (meet_id)
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

  default_scope { where(expired: false) }

  alias really_destroy! destroy
  # now override the method
  def destroy
    update_attribute(:expired, true) # skips validations
  end
end
