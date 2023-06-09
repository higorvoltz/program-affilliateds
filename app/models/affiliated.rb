# frozen_string_literal: true

class Affiliated < ApplicationRecord
  belongs_to :productor

  validates :name, presence: true
  validates :email, presence: true
  validates :balance, presence: true
  validates :productor_id, presence: true
  validates :password_digest, presence: true

  has_secure_password
end
