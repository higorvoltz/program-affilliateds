# frozen_string_literal: true

class Productor < ApplicationRecord
  has_many :affiliateds
  has_many :products

  validates :name, presence: true
  validates :email, presence: true
  validates :balance, presence: true

  has_secure_password
end
