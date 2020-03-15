class AddDeliveredAtToSendEmail < ActiveRecord::Migration
  def change
    add_column :send_emails, :delivered_at, :datetime
  end
end
