# frozen_string_literal: true

# == Schema Information
#
# Table name: carer_to_meets
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  carer_id   :bigint           indexed
#  meet_id    :bigint           indexed
#
# Indexes
#
#  index_carer_to_meets_on_carer_id  (carer_id)
#  index_carer_to_meets_on_meet_id   (meet_id)
#
# Foreign Keys
#
#  fk_carer_to_meet_carer  (carer_id => carers.id)
#  fk_carer_to_meet_meet   (meet_id => meets.id)
#

class CarerToMeet < ApplicationRecord
  belongs_to :carer, inverse_of: :carer_to_meets
  belongs_to :meet, inverse_of: :carer_to_meets

  validates_uniqueness_of :meet_id, scope: :carer_id
end
