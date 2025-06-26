# frozen_string_literal: true

# == Schema Information
#
# Table name: child_to_meets
#
#  id         :bigint           not null, primary key
#  child_id   :bigint           indexed
#  meet_id    :bigint           indexed
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ChildToMeet < ApplicationRecord
  belongs_to :child, inverse_of: :child_to_meets
  belongs_to :meet, inverse_of: :child_to_meets

  validates_uniqueness_of :meet_id, scope: :child_id
end
