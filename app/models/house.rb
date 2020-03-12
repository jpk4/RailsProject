# frozen_string_literal: true

class House < ApplicationRecord
  has_many :seats
  has_and_belongs_to_many :characters
end
