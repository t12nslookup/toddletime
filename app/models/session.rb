class Session < ActiveRecord::Base
  has_many :leader_to_session
  has_many :job, through: :leader_to_session
  has_many :leader, through: :leader_to_session
  has_many :child_to_session
  has_many :child, through: :child_to_session
end
