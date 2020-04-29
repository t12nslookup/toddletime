class AddDeliveredAtToSendEmail < ActiveRecord::Migration[5.2]
  def change
    add_column :send_emails, :delivered_at, :datetime
  end
end
