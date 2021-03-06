# frozen_string_literal: true

class AliasesController < ApplicationController
  def index
    @aliases = Alias.includes(:character).order(:name).page(params[:page])
  end

  def show
    @alias = Alias.find(params[:id])
  end
end
