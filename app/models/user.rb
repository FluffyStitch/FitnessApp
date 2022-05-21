# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :progresses, dependent: :destroy

  validates :username, :password, presence: true
  validates :username, uniqueness: true
end
