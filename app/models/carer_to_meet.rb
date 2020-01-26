# == Schema Information
#
# Table name: carer_to_meets
#
#  id         :integer          not null, primary key
#  carer_id   :integer          indexed
#  meet_id    :integer          indexed
#  created_at :datetime
#  updated_at :datetime
#
# Foreign Keys
#
#  fk_carer_to_meet_carer  (carer_id => carers.id)
#  fk_carer_to_meet_meet   (meet_id => meets.id)
#

class CarerToMeet < ActiveRecord::Base
  belongs_to :carer, inverse_of: :carer_to_meets
  belongs_to :meet, inverse_of: :carer_to_meets

  validates_uniqueness_of :meet_id, scope: :carer_id
end
