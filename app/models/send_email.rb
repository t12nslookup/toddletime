# == Schema Information
#
# Table name: send_emails
#
#  id           :integer          not null, primary key
#  addresses    :string
#  subject      :string
#  body         :string
#  meet_type_id :integer          indexed
#  state        :integer          default("0")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  delivered_at :datetime
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
