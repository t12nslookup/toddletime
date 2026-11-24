# frozen_string_literal: true

# == Schema Information
#
# Table name: leader_meet_types
#
#  id           :bigint           not null, primary key
#  expired      :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  leader_id    :bigint           indexed
#  meet_type_id :bigint           indexed
#
# Indexes
#
#  index_leader_meet_types_on_leader_id     (leader_id)
#  index_leader_meet_types_on_meet_type_id  (meet_type_id)
#
# Foreign Keys
#
#  fk_leader_meet_type_leader     (leader_id => leaders.id)
#  fk_leader_meet_type_meet_type  (meet_type_id => meet_types.id)
#

class LeaderMeetType < ApplicationRecord
  belongs_to :leader
  belongs_to :meet_type
  has_many :job

  validates_uniqueness_of :leader_id, scope: :meet_type_id

  default_scope { where(expired: 0) }

  alias really_destroy! destroy
  # now override the method
  def destroy
    update_attribute(:expired, 1) # skips validations
  end
end
