# frozen_string_literal: true

# == Schema Information
#
# Table name: children
#
#  id                 :bigint           not null, primary key
#  name               :string
#  gender             :string
#  date_of_birth      :date
#  address            :string
#  postcode           :string
#  medical_conditions :string
#  special_needs      :string
#  registered_date    :date
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  emergency_contact  :string
#

class Child < ApplicationRecord
  has_many :carer_to_children, inverse_of: :child
  has_many :carers, through: :carer_to_children
  has_many :child_to_meets, inverse_of: :child
  has_many :meet, through: :child_to_meets

  validates :name, presence: true,
                   length: { minimum: 5 }
  validates :registered_date, presence: true

  scope :search, ->(text) { where('upper(name) like ?', "%#{text.upcase}%") }
  # scope :recent, ->{ joins(:meet).merge(Meet.recent) }
  scope :recent, lambda {
                   eager_load(:meet).where('meet_date > :recent or children.created_at > :recent', { recent: (Date.today - 6.months) })
                 }
  scope :in_order, -> { order('name') }
  scope :with_condition, -> { where.not(medical_conditions: ['', 'none']) }

  # default_scope { where(expired: nil) }
  #
  # alias really_destroy! destroy
  # # now override the method
  # def destroy
  #   update_attribute(:expired, Date.today) # skips validations
  # end
end
