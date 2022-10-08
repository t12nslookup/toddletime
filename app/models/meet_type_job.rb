# frozen_string_literal: true

# == Schema Information
#
# Table name: meet_type_jobs
#
#  id           :integer          not null, primary key
#  job_id       :integer          indexed
#  meet_type_id :integer          indexed
#  count        :integer          default(0)
#  created_at   :datetime
#  updated_at   :datetime
#
# Foreign Keys
#
#  fk_meet_type_job_job        (job_id => jobs.id)
#  fk_meet_type_job_meet_type  (meet_type_id => meet_types.id)
#

class MeetTypeJob < ApplicationRecord
  belongs_to :job, inverse_of: :meet_type_jobs
  belongs_to :meet_type, inverse_of: :meet_type_jobs

  scope :has_count, -> { where('count > 0') }

  # validates :count, presence: true
  validates :count, :meet_type_id, :job_id, presence: true
  validates_uniqueness_of :job_id, scope: :meet_type_id
end
