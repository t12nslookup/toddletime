class SendEmail < ActiveRecord::Base
  belongs_to :meet_type, inverse_of: :send_emails
end
