class Child < ActiveRecord::Base
  has_many :carer_to_child
  has_many :carer, through: :carer_to_child
  has_many :child_to_session
  has_many :session, through: :child_to_session
end
