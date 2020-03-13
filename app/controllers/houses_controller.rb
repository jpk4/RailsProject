# frozen_string_literal: true

class HousesController < ApplicationController
  def index
    @houses = House.order(:name).page(params[:page])
  end

  def show
    @house = House.find(params[:id])
  end
end
