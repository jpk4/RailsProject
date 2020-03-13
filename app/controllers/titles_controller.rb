# frozen_string_literal: true

class TitlesController < ApplicationController
  def index
    @titles = Title.all.order(:name)
  end

  def show
    @title = Title.find(params[:id])
  end
end
