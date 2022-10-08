# frozen_string_literal: true

# == Schema Information
#
# Table name: how_heards
#
#  id            :integer          not null, primary key
#  location_name :string(255)
#  expired       :integer          default(0)
#  created_at    :datetime
#  updated_at    :datetime
#

class HowHeard < ApplicationRecord
  has_many :carers, inverse_of: :how_heard

  scope :in_order, -> { order('location_name') }

  validates :location_name, presence: true, uniqueness: true

  default_scope { where(expired: 0) }

  alias really_destroy! destroy
  # now override the method
  def destroy
    update_attribute(:expired, 1) # skips validations
  end
end
