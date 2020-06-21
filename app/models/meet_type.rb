# == Schema Information
#
# Table name: meet_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  deleted    :integer          default("0")
#  created_at :datetime
#  updated_at :datetime
#

class MeetType < ActiveRecord::Base
  has_many :meets, inverse_of: :meet_type
  has_many :leader_meet_types, inverse_of: :meet_type
  has_many :leaders, through: :leader_meet_types
  has_many :meet_type_jobs, inverse_of: :meet_type
  has_many :jobs, through: :meet_type_jobs
  has_many :send_emails, inverse_of: :meet_type

  scope :in_order, -> { order('name') }

  validates :name, presence: true, uniqueness: true
  accepts_nested_attributes_for :meet_type_jobs
  # , reject_if: proc {|mtj| mtj.count < 0}
end
