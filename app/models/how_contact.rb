# == Schema Information
#
# Table name: how_contacts
#
#  id           :integer          not null, primary key
#  contact_type :string
#  expired      :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class HowContact < ActiveRecord::Base
  has_many :carers, inverse_of: :how_contact

  scope :in_order, -> { order('contact_type') }

  validates :contact_type, presence: true, uniqueness: true
end
