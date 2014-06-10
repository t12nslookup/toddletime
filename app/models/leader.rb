class Leader < ActiveRecord::Base
  has_many :leader_to_meet
  has_many :meets, through: :leader_to_meet
  validates :name, presence: true,
                   length: { minimum: 5 }

  scope :in_order, ->{ order("name") }

  validates_uniqueness_of :name
end
