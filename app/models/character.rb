# frozen_string_literal: true

class Character < ApplicationRecord
  has_many :aliases
  has_and_belongs_to_many :books
  has_and_belongs_to_many :houses
  has_and_belongs_to_many :titles

  validates :name, presence: true
end
