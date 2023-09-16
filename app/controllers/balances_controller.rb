class BalancesController < ApplicationController
  before_action :set_balance, only: [:show, :edit, :update]

  def index
    # @balances = current_user.balances
    @balances = Balance.all
  end

  def show
    @balances = Balance.all
    @targets = TargetAmount.all
  end

  def new
    @balance = Balance.new
  end

  def create
    @balance = Balance.new(balance_params)
    @balance.user = current_user
    if @balance.save
      redirect_to balance_path(@balance), Notice: "Balance created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end


  def update
    if @balance.update(balance_params)
      redirect_to balance_path(@balance), Notice: "Balance updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private
  def set_balance
    @balance = Balance.find(params[:id])
  end

  def balance_params
    params.require(:balance).permit(:current_balance, :account_number)
  end
end
