require "./app/services/wine_seeder.rb"

class WinesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    return super unless params[:search]
    render(
      json: search_wines(params[:search])
    )
  end

  def rate
    wine = Wine.find(params[:id])
    wine.ratings.create! value: params[:value]
    render json: wine.serialize
  end

  def seed
    WineSeeder.new.call
    render json: {}
  end

  private

  def search_wines(search)
    wines = Wine.where("name ilike ?", "%#{search}%")
    wines.map do |wine|
      wine.serialize
    end
  end
end
