# frozen_string_literal: true

class House < ApplicationRecord
  has_many :seats
  has_and_belongs_to_many :characters
  has_and_belongs_to_many :titles

  validates :name, :url_id, presence: true
  validates_associated :seats
  paginates_per 12
end
