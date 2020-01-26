# == Schema Information
#
# Table name: children
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  gender             :string(255)
#  date_of_birth      :date
#  address            :string(255)
#  postcode           :string(255)
#  medical_conditions :string(255)
#  special_needs      :string(255)
#  registered_date    :date
#  created_at         :datetime
#  updated_at         :datetime
#  emergency_contact  :string
#

class Child < ActiveRecord::Base
  has_many :carer_to_children, inverse_of: :child
  has_many :carers, through: :carer_to_children
  has_many :child_to_meets, inverse_of: :child
  has_many :meet, through: :child_to_meets

  validates :name, presence: true,
                   length: { minimum: 5 }
  validates :registered_date, presence: true

  scope :search, ->(text) { where('upper(name) like ?', '%' + text.upcase + '%') }
  # scope :recent, ->{ joins(:meet).merge(Meet.recent) }
  scope :recent, -> { eager_load(:meet).where('meet_date > :recent or children.created_at > :recent', { recent: (Date.today - 6.months) }) }
  scope :in_order, -> { order('name') }
  scope :with_condition, -> { where.not( medical_conditions: ['', 'none'] ) }

end
