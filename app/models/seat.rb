# frozen_string_literal: true

class Seat < ApplicationRecord
  belongs_to :house

  validates :name, presence: true
end
