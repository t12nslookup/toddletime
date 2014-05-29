class LeaderToSession < ActiveRecord::Base
  belongs_to :leader
  belongs_to :job
  belongs_to :session
end
