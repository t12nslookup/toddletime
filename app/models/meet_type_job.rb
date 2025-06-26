# frozen_string_literal: true

# == Schema Information
#
# Table name: meet_type_jobs
#
#  id           :bigint           not null, primary key
#  job_id       :bigint           indexed
#  meet_type_id :bigint           indexed
#  count        :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class MeetTypeJob < ApplicationRecord
  belongs_to :job, inverse_of: :meet_type_jobs
  belongs_to :meet_type, inverse_of: :meet_type_jobs

  scope :has_count, -> { where('count > 0') }

  # validates :count, presence: true
  validates :count, :meet_type_id, :job_id, presence: true
  validates_uniqueness_of :job_id, scope: :meet_type_id
end
