# frozen_string_literal: true

class HousesController < ApplicationController
  def index
    @houses = House.order(:name).page(params[:page])
  end

  def show
    @house = House.find(params[:id])
  end

  def search
    @houses = House.where('name LIKE ?', "%#{params[:search_term]}%")
  end
end
