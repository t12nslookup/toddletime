class Leader < ActiveRecord::Base
  has_many :leader_to_session
  has_many :session, through: :leader_to_session
  validates :name, presence: true,
                   length: { minimum: 5 }
end
