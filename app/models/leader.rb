class Leader < ActiveRecord::Base
  has_many :leader_to_meet
  has_many :meets, through: :leader_to_meet

  scope :in_order, ->{ order("name") }

  validates :name, presence: true,
                   length: { minimum: 5 }
  validates_uniqueness_of :name
end
