# frozen_string_literal: true

# == Schema Information
#
# Table name: carer_to_children
#
#  id           :integer          not null, primary key
#  child_id     :integer          indexed
#  carer_id     :integer          indexed
#  relationship :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#
# Foreign Keys
#
#  fk_carer_to_child_carer  (carer_id => carers.id)
#  fk_carer_to_child_child  (child_id => children.id)
#

class CarerToChild < ApplicationRecord
  belongs_to :child, inverse_of: :carer_to_children
  belongs_to :carer, inverse_of: :carer_to_children

  validates :relationship, presence: true
  validates_uniqueness_of :child_id, scope: :carer_id
end
