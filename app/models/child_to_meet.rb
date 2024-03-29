# frozen_string_literal: true

# == Schema Information
#
# Table name: child_to_meets
#
#  id         :integer          not null, primary key
#  child_id   :integer          indexed
#  meet_id    :integer          indexed
#  created_at :datetime
#  updated_at :datetime
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
