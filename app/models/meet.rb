# frozen_string_literal: true

# == Schema Information
#
# Table name: meets
#
#  id           :bigint           not null, primary key
#  meet_date    :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  meet_type_id :bigint           indexed
#

class Meet < ApplicationRecord
  has_many :rota_leaders, inverse_of: :meet
  has_many :jobs, through: :rota_leaders
  has_many :leaders, through: :rota_leaders
  has_many :child_to_meets, inverse_of: :meet
  has_many :carer_to_meets, inverse_of: :meet
  has_many :children, through: :child_to_meets
  has_many :carers, through: :carer_to_meets
  has_many :leader_to_meets, inverse_of: :meet
  has_many :leaders, through: :leader_to_meets
  belongs_to :meet_type, inverse_of: :meets

  scope :in_order, -> { order(:meet_date) }
  scope :in_reverse, -> { order(meet_date: :desc) }

  scope :meets_today, -> { where('meet_date = :today', today: Date.today.to_s) }
  scope :find_historic, -> { where('meet_date < :today', today: Date.today.to_s) }
  scope :find_future, -> { where('meet_date >= :today', today: Date.today.to_s) }
  # scope :recent, ->{ where('meet_date >= :recent', {recent: (Date.today - 6.months).to_s}) }

  validates :meet_date, presence: true, uniqueness: true
  accepts_nested_attributes_for :rota_leaders
end
