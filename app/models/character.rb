# frozen_string_literal: true

class Character < ApplicationRecord
  has_many :alias
  has_and_belongs_to_many :books
  has_and_belongs_to_many :houses
  has_and_belongs_to_many :titles
end
