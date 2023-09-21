class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show]
  def index
    # @transactions = Transaction.all
    @transactions = current_user.Transaction.all
  end

  def show

  end


  def new
    @transaction = Transaction.new
  end


  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      if @transaction.type == "Debit"
        @balance = @balance.current_balance + @transaction.amount
      else
        @balance = @balance.current_balance - @transaction.amount
      end
      redirect_to balances_path, notice: 'Transaction was successfully created.'
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
