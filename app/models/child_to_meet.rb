# frozen_string_literal: true

# == Schema Information
#
# Table name: child_to_meets
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  child_id   :bigint           indexed
#  meet_id    :bigint           indexed
#
# Indexes
#
#  index_child_to_meets_on_child_id  (child_id)
#  index_child_to_meets_on_meet_id   (meet_id)
#
# Foreign Keys
#
#  fk_child_to_meet_child  (child_id => children.id)
#  fk_child_to_meet_meet   (meet_id => meets.id)
#

class ChildToMeet < ApplicationRecord
  belongs_to :child, inverse_of: :child_to_meets
  belongs_to :meet, inverse_of: :child_to_meets

  validates_uniqueness_of :meet_id, scope: :child_id
end
