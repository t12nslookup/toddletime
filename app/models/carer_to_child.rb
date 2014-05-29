class CarerToChild < ActiveRecord::Base
  belongs_to :child
  belongs_to :carer
end
