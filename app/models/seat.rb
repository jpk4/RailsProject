# frozen_string_literal: true

class Seat < ApplicationRecord
  belongs_to :house

  validates :name, presence: true
  validates :name, uniqueness: true
end
