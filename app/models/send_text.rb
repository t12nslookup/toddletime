# == Schema Information
#
# Table name: send_texts
#
#  id           :bigint           not null, primary key
#  addresses    :string
#  message      :string
#  meet_type_id :bigint           indexed
#  state        :integer          default("0")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Foreign Keys
#
#  fk_rails_...  (meet_type_id => meet_types.id)
#
class SendText < ApplicationRecord
  belongs_to :meet_type, inverse_of: :send_texts, optional: true

  scope :in_order, -> { order('created_at desc') }
  scope :recent, -> { where('created_at > :recent', recent: (Date.today - 7.months)) }

  def meet_name
    meet_type_id.nil? ? 'Special Event' : meet_type.name
  end
end
