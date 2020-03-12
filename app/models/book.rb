# frozen_string_literal: true

class Book < ApplicationRecord
  has_and_belongs_to_many :characters

  validates :name, presence: true
  validates :number_of_pages, numericality: { only_integer: true }
end
