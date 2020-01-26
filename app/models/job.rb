# == Schema Information
#
# Table name: jobs
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Job < ActiveRecord::Base
  # belongs_to :leader_to_job
  # has_many :leaders, through: :leader_to_jobs
  has_many :meet_type_jobs, inverse_of: :job
  has_many :meet_types, through: :meet_type_jobs
  has_many :rota_leaders, inverse_of: :job

  scope :in_order, -> { order('name') }

  validates :name, presence: true, uniqueness: true
end
