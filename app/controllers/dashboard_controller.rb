class DashboardController < ApplicationController
  before_action :authenticate_user

  def index
    @target_amounts = current_user.target_amounts
    @transactions = current_user.transactions
    @balances = current_user.balances
  end
end
