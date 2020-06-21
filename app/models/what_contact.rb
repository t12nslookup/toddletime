# == Schema Information
#
# Table name: what_contacts
#
#  id           :bigint           not null, primary key
#  contact_type :string
#  expired      :integer          default("0")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class WhatContact < ActiveRecord::Base
  has_many :carers, inverse_of: :what_contact

  scope :in_order, -> { order('contact_type') }

  validates :contact_type, presence: true, uniqueness: true
end
