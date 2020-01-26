# == Schema Information
#
# Table name: send_emails
#
#  id           :integer          not null, primary key
#  addresses    :string
#  subject      :string
#  body         :string
#  meet_type_id :integer          indexed
#  state        :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Foreign Keys
#
#  fk_rails_...  (meet_type_id => meet_types.id)
#

class SendEmail < ActiveRecord::Base
  belongs_to :meet_type, inverse_of: :send_emails
end
