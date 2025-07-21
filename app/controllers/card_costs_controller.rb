class CardCostsController < ApplicationController
  def index
    @card_costs = CardCost.all
    render json: @card_costs
  end

  def create
    @card_cost = CardCost.new(card_cost_params)
    if @card_cost.save
      render json: @card_cost, status: :created
    else
      render json: { errors: @card_cost.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def card_cost_params
    params.require(:card_cost).permit(:card_number, :cost, :currency)
  end
end
