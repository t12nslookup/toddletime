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
  has_many :carer_to_children
  has_many :children, through: :carer_to_children
  has_many :carer_to_meet
  has_many :meet, through: :carer_to_meet
  belongs_to :how_heard
  belongs_to :how_contact
  belongs_to :what_contact

  scope :search, ->(text) { where('upper(name) like ?', '%' + text.upcase + '%') }
  scope :recent, -> { eager_load(:meet).where('meet_date > :recent or carers.created_at > :recent', { recent: (Date.today - 6.months) }) }
  scope :in_order, -> { order('name') }
  validates :name, :phone, presence: true

end
