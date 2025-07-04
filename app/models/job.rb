# frozen_string_literal: true

# == Schema Information
#
# Table name: jobs
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Job < ApplicationRecord
  # belongs_to :leader_to_job
  # has_many :leaders, through: :leader_to_jobs
  has_many :meet_type_jobs, inverse_of: :job
  has_many :meet_types, through: :meet_type_jobs
  has_many :rota_leaders, inverse_of: :job

  scope :in_order, -> { order('name') }

  validates :name, presence: true, uniqueness: true
end
