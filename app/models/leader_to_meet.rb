# frozen_string_literal: true

# == Schema Information
#
# Table name: leader_to_meets
#
#  id         :bigint           not null, primary key
#  meet_id    :bigint           indexed
#  leader_id  :bigint           indexed
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class LeaderToMeet < ApplicationRecord
  belongs_to :meet, inverse_of: :leader_to_meets
  belongs_to :leader, inverse_of: :leader_to_meets

  validates_uniqueness_of :meet_id, scope: :leader_id
end
