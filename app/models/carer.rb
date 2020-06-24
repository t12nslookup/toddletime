# == Schema Information
#
# Table name: carers
#
#  id              :bigint           not null, primary key
#  name            :string
#  phone           :string
#  email           :string
#  can_contact     :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  address         :string
#  postcode        :string
#  how_heard_id    :bigint           indexed
#  other_heard     :string
#  how_contact_id  :bigint           indexed
#  what_contact_id :bigint           indexed
#
# Foreign Keys
#
#  fk_carer_to_how_contact   (how_contact_id => how_contacts.id)
#  fk_carer_to_how_heard     (how_heard_id => how_heards.id)
#  fk_carer_to_what_contact  (what_contact_id => what_contacts.id)
#

class Carer < ApplicationRecord
  has_many :carer_to_children, inverse_of: :carer
  has_many :children, through: :carer_to_children
  has_many :carer_to_meets, inverse_of: :carer
  has_many :meets, through: :carer_to_meets
  belongs_to :how_heard, inverse_of: :carers, optional: true
  belongs_to :what_contact, inverse_of: :carers
  has_many :carer_to_how_contacts, inverse_of: :carer
  has_many :how_contacts, through: :carer_to_how_contacts

  scope :search, ->(text) { where('upper(name) like ?', '%' + text.upcase + '%') }
  scope :recent, -> { eager_load(:meets).where('meet_date > :recent or carers.created_at > :recent', { recent: (Date.today - 6.months) }) }
  scope :meet_recent, -> { eager_load(:meets).where('meet_date > :recent or carers.created_at > :recent', { recent: (Date.today - 2.months) }) }
  scope :in_order, -> { order('name') }
  validates :name, :phone, presence: true

  def meet_email?(meet_type_id)
    meet_type = MeetType.find(meet_type_id).name.downcase.delete(' ')
    what_contact.present? &&
      ['all', meet_type].include?(what_contact.contact_type.downcase.delete(' ')) &&
      (how_contacts & email_types).any?
  end

  def meet_text?(meet_type_id)
    meet_type = MeetType.find(meet_type_id).name.downcase.delete(' ')
    what_contact.present? &&
      ['all', meet_type].include?(what_contact.contact_type.downcase.delete(' ')) &&
      (how_contacts & text_types).any?
  end

  def meet_recent?(meet_type_id)
    mts = Meet.where('meet_type_id = :meet_type and meet_date > :recent', { meet_type: meet_type_id, recent: (Date.today - 2.months) })
    mts = Meet.where(meet_type: meet_type_id).in_order.last(6) if mts.count < 6
    (meets & mts).any?
  end

  def events_email?
    what_contact.present? &&
      %w[all specialevents].include?(what_contact.contact_type.downcase.delete(' ')) &&
      (how_contacts & email_types).any?
  end

  def full_email
    '"' + name + '" <' + email + '>'
  end

  private

  def email_types
    @email_types || HowContact.where('lower(contact_type) in (?)', %w[email all])
  end

  def text_types
    @text_types || HowContact.where('lower(contact_type) in (?)', %w[text all])
  end
end
