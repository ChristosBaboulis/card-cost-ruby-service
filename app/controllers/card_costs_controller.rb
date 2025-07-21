class CardCostsController < ApplicationController
  protect_from_forgery with: :null_session
  require 'httparty'

  # GET /card_costs
  def index
    @card_costs = CardCost.all
    render json: @card_costs
  end

  # POST /card_costs
  def create
    @card_cost = CardCost.new(card_cost_params)
    if @card_cost.save
      render json: @card_cost, status: :created
    else
      render json: { errors: @card_cost.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # POST /card_costs/binlist_cost
  def binlist_cost
    card_number = params[:card_number]
    if card_number.blank?
      render json: { error: 'card_number is required' }, status: :bad_request and return
    end

    response = HTTParty.get("https://lookup.binlist.net/#{card_number}", headers: { "Accept-Version" => "3" })

    if response.code != 200
      render json: { error: 'Invalid card number or API error' }, status: :bad_request and return
    end

    country_code = response.dig("country", "alpha2")

    if country_code.blank?
      render json: { error: 'Country not found' }, status: :bad_request and return
    end

    cost_entry = CardCost.where(country_code: country_code).first ||
                 CardCost.where(country_code: 'OTHERS').first

    if cost_entry.nil?
      render json: { error: 'No cost configuration found' }, status: :internal_server_error and return
    end

    render json: {
      country: country_code,
      cost: cost_entry.cost
    }
  end

  private

  def card_cost_params
    params.require(:card_cost).permit(:card_number, :cost, :currency, :country_code)
  end
end
