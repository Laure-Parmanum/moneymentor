class BalancesController < ApplicationController
  # before_action :set_balance, only: [:show, :edit, :update]

  # GET /balances
  # This is where the user is directed when clicking on the balance icon on the hompeage
  def index
    # @balances = current_user.balances
    # @balances = current_user.Balances.all - to recheck
    @balances = Balance.all
  end

  # GET/balances/1
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
      redirect_to balance_path(@balance)
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
    params.require(:balance).permit(:date, :current_balance, :account_number)
  end
end
