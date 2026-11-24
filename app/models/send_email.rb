# frozen_string_literal: true

# == Schema Information
#
# Table name: send_emails
#
#  id           :bigint           not null, primary key
#  addresses    :string
#  body         :string
#  delivered_at :datetime
#  state        :integer          default(0)
#  subject      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  meet_type_id :bigint           indexed
#
# Indexes
#
#  index_send_emails_on_meet_type_id  (meet_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (meet_type_id => meet_types.id)
#

class SendEmail < ApplicationRecord
  belongs_to :meet_type, inverse_of: :send_emails, optional: true

  scope :in_order, -> { order('created_at desc') }
  scope :recent, -> { where('created_at > :recent', recent: (Date.today - 7.months)) }

  def meet_name
    meet_type_id.nil? ? 'Special Event' : meet_type.name
  end
end
