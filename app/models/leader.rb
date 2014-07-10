class Leader < ActiveRecord::Base
  has_many :leader_to_meets
  has_many :meets, through: :leader_to_meets
  has_many :leader_meet_types
  has_many :meet_types, through: :leader_meet_types

#  accepts_nested_attributes_for :leader_meet_type
# , :reject_if => lambda { |a| a[:meet_type_id] == 0}, :allow_destroy => true
# , :reject_if => lambda { |a| a[:id].blank? }

  scope :in_order, ->{ order("name") }

  validates :name, presence: true,
                   length: { minimum: 5 }
  validates_uniqueness_of :name

end
