class LeaderToMeet < ActiveRecord::Base
  belongs_to :leader
  belongs_to :job
  belongs_to :meet
end
