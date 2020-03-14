# frozen_string_literal: true

class SeatsController < ApplicationController
  def index
    @seats = Seat.includes(:house).order(:name).page(params[:page])
  end

  def show
    @seat = Seat.find(params[:id])
  end
end
