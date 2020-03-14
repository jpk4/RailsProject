# frozen_string_literal: true

class TitlesController < ApplicationController
  def index
    @titles = Title.order(:name).page(params[:page])
  end

  def show
    @title = Title.find(params[:id])
  end
end
