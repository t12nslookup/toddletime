# frozen_string_literal: true

# == Schema Information
#
# Table name: leader_meet_types
#
#  id           :bigint           not null, primary key
#  leader_id    :bigint           indexed
#  meet_type_id :bigint           indexed
#  expired      :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
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
