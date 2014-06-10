class ChildToMeet < ActiveRecord::Base
  belongs_to :child
  belongs_to :session
end
