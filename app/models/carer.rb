# == Schema Information
#
# Table name: carers
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  phone           :string(255)
#  email           :string(255)
#  can_contact     :integer
#  created_at      :datetime
#  updated_at      :datetime
#  address         :string(255)
#  postcode        :string(255)
#  how_heard_id    :integer          indexed
#  other_heard     :string(255)
#  how_contact_id  :integer          indexed
#  what_contact_id :integer          indexed
#
# Foreign Keys
#
#  fk_carer_to_how_heard  (how_heard_id => how_heards.id)
#

class Carer < ActiveRecord::Base
  has_many :carer_to_children, inverse_of: :carer
  has_many :children, through: :carer_to_children
  has_many :carer_to_meets, inverse_of: :carer
  has_many :meet, through: :carer_to_meets
  belongs_to :how_heard, inverse_of: :carers
  belongs_to :how_contact, inverse_of: :carers
  belongs_to :what_contact, inverse_of: :carers

  scope :search, ->(text) { where('upper(name) like ?', '%' + text.upcase + '%') }
  scope :recent, -> { eager_load(:meet).where('meet_date > :recent or carers.created_at > :recent', { recent: (Date.today - 6.months) }) }
  scope :email_recent, -> { eager_load(:meet).where('meet_date > :recent or carers.created_at > :recent', { recent: (Date.today - 2.months) }) }
  scope :in_order, -> { order('name') }
  validates :name, :phone, presence: true

  def meet_email?(meet_type_id)
    meet_type = MeetType.find(meet_type_id).name.downcase.delete(' ')
    ['all', meet_type].include?(what_contact.contact_type.downcase.delete(' ')) &&
      %w[email all].include?(how_contact.contact_type.downcase)
  end

  def events_email?
    %w[all specialevents].include?(what_contact.contact_type.downcase.delete(' ')) &&
      %w[email all].include?(how_contact.contact_type.downcase)
  end

  def full_email
    '"' + name + '" <' + email + '>'
  end
end
