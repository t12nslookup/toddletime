class Job < ActiveRecord::Base
  has_many :leader_to_session
end
