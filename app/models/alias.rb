# frozen_string_literal: true

class Alias < ApplicationRecord
  belongs_to :character

  validates :name, presence: true
  validates :name, uniqueness: true

  paginates_per 18
end
