# frozen_string_literal: true

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

class HowContact < ApplicationRecord
  has_many :carer_to_how_contacts, inverse_of: :how_contact
  has_many :carers, through: :carer_to_how_contacts

  scope :in_order, -> { order('contact_type') }

  validates :contact_type, presence: true, uniqueness: true

  default_scope { where(expired: 0) }

  alias really_destroy! destroy
  # now override the method
  def destroy
    update_attribute(:expired, 1) # skips validations
  end
end
