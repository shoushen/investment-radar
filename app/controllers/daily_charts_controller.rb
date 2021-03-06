# frozen_string_literal: true

class DailyChartsController < BaseChartsController
  def index
    symbol = params[:symbol]
    token = Rails.application.credentials[Rails.env.to_sym][:decision_engine_token]

    render json: DecisionEngine::DailyChart.new(token).call(symbol)
  end
end
