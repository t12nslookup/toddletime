# frozen_string_literal: true

# == Schema Information
#
# Table name: carer_to_how_contacts
#
#  id             :bigint           not null, primary key
#  carer_id       :bigint           not null, indexed
#  how_contact_id :bigint           not null, indexed
#  expired        :integer          default(0), not null, indexed
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Foreign Keys
#
#  fk_rails_...  (carer_id => carers.id)
#  fk_rails_...  (how_contact_id => how_contacts.id)
#
class CarerToHowContact < ApplicationRecord
  belongs_to :carer, inverse_of: :carer_to_how_contacts
  belongs_to :how_contact, inverse_of: :carer_to_how_contacts

  default_scope { where(expired: 0) }

  alias really_destroy! destroy
  # now override the method
  def destroy
    update_attribute(:expired, 1) # skips validations
  end
end
