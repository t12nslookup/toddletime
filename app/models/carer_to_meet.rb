# frozen_string_literal: true

# == Schema Information
#
# Table name: carer_to_meets
#
#  id         :bigint           not null, primary key
#  carer_id   :bigint           indexed
#  meet_id    :bigint           indexed
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CarerToMeet < ApplicationRecord
  belongs_to :carer, inverse_of: :carer_to_meets
  belongs_to :meet, inverse_of: :carer_to_meets

  validates_uniqueness_of :meet_id, scope: :carer_id
end
