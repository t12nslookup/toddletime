# == Schema Information
#
# Table name: how_contacts
#
#  id           :integer          not null, primary key
#  contact_type :string
#  expired      :integer          default("0")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class HowContact < ActiveRecord::Base
  has_many :carer_to_how_contacts, inverse_of: :how_contact
  has_many :carers, through: :carer_to_how_contacts

  scope :in_order, -> { order('contact_type') }

  validates :contact_type, presence: true, uniqueness: true
end
