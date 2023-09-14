class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show]
  def index
    @transactions = Balance.all
  end

  def show

  end


  def new
    @transaction = Transaction.new
  end


  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      @transaction.update_balance
      redirect_to transactions_path, notice: 'Transaction was successfully created.'
      # could be redirected to balance_path
    else
      render :new
    end
  end


private
  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:date, :amount, :description, :payment_method, :category, :photo, :type)
  end
end
