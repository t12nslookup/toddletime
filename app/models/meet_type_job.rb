class MeetTypeJob < ActiveRecord::Base
  belongs_to :job
  belongs_to :meet_type

  #validates :count, presence: true
  validates :count, :meet_type_id, :job_id, presence: true
  validates_uniqueness_of :job_id, scope: :meet_type_id
end
