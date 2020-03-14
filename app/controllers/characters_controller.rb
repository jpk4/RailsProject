# frozen_string_literal: true

class CharactersController < ApplicationController
  def index
    @characters = Character.order(:name).page(params[:page])
  end

  def show
    @character = Character.find(params[:id])
  end

  def search
    @characters = Character.where('name LIKE ?', "%#{params[:search_char]}%")
  end
end
