# frozen_string_literal: true

class CharactersController < ApplicationController
  def index
    @characters = Character.order(:name).page(params[:page])
  end

  def show
    @character = Character.find(params[:id])
  end

  def search
    if params[:search_id].empty?
      @characters = Character.where('name LIKE ?', "%#{params[:search_char]}%").order(:name)
    else
      @characters = Character.joins('join characters_houses on characters.id = characters_houses.character_id').where('name LIKE ? AND characters_houses.house_id = ?', "%#{params[:search_char]}%", params[:search_id]).order(:name)
      @house_name = House.find(params[:search_id])
    end
  end
end
