# frozen_string_literal: true

class House < ApplicationRecord
  has_many :seats
end
