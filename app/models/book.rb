# frozen_string_literal: true

class Book < ApplicationRecord
  has_and_belongs_to_many :characters
end
