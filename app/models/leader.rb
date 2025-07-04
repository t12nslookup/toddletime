# frozen_string_literal: true

# == Schema Information
#
# Table name: leaders
#
#  id         :bigint           not null, primary key
#  name       :string
#  email      :string
#  expired    :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  dbs        :date
#

class Leader < ApplicationRecord
  has_many :rota_leaders, inverse_of: :leader
  has_many :meets, through: :rota_leaders
  has_many :leader_meet_types, inverse_of: :leader
  has_many :meet_types, through: :leader_meet_types
  has_many :leader_to_meets, inverse_of: :leader

  #  accepts_nested_attributes_for :leader_meet_type
  # , :reject_if => lambda { |a| a[:meet_type_id] == 0}, :allow_destroy => true
  # , :reject_if => lambda { |a| a[:id].blank? }

  scope :active, -> { where(expired: nil) }
  scope :search, ->(text) { where('upper(name) like ?', "%#{text.upcase}%") }
  scope :in_order, -> { order(:name) }

  validates :name, presence: true,
                   length: { minimum: 5 }
  validates_uniqueness_of :name

  default_scope { where(expired: nil) }

  alias really_destroy! destroy
  # now override the method
  def destroy
    update_attribute(:expired, Date.today) # skips validations
  end
end
