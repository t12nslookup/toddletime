# frozen_string_literal: true

# == Schema Information
#
# Table name: carer_to_children
#
#  id           :bigint           not null, primary key
#  child_id     :bigint           indexed
#  carer_id     :bigint           indexed
#  relationship :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class CarerToChild < ApplicationRecord
  belongs_to :child, inverse_of: :carer_to_children
  belongs_to :carer, inverse_of: :carer_to_children

  validates :relationship, presence: true
  validates_uniqueness_of :child_id, scope: :carer_id
end
