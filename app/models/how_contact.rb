class HowContact < ActiveRecord::Base
  has_many :carers

  scope :in_order, -> { order('contact_type') }

  validates :contact_type, presence: true, uniqueness: true
end
