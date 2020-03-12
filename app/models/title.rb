# frozen_string_literal: true

class Title < ApplicationRecord
  has_and_belongs_to_many :characters
  has_and_belongs_to_many :houses

  validates :name, presence: true
end
