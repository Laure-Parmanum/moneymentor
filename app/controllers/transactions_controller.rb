class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :new, :create]
  def index
    # # search all balances which belongs to the current user
    # @balances = Balance.all.where(user: current_user)
    # # search all target amounts which belongs to the balances created from current user
    # @transactions = Transaction.all.where(balance: @balances)

     # Search all balances belonging to the current user
     @balances = current_user.balances.includes(:transactions)
     @transactions = @balances.flat_map(&:transactions)
  end

  def show

  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.balance = @balance
    if @transaction.transaction_type == "Credit"
      if @balance.current_balance >= @transaction.amount
        # Sufficient balance for credit
        @balance.current_balance -= @transaction.amount
      else
        # Insufficient balance for credit
        @transaction.errors.add(:base, "Insufficient balance for this transaction.")
        render :new
        return
      end
    elsif @transaction.transaction_type == "Debit"
      # Credit transaction, simply add the amount to the balance
      @balance.current_balance += @transaction.amount
    else
      # Invalid transaction type
      @transaction.errors.add(:transaction_type, "Invalid transaction type.")
      render :new
      return
    end
    # Save the balance after adjusting it
    if @balance.save && @transaction.save
      redirect_to balances_path, notice: 'Transaction was successfully created.'
    else
      render :new
    end
  end

  # def create
  #   # @transaction = Transaction.new(transaction_params)

  #   # if @transaction.save
  #   #   if @transaction.type == "Debit"
  #   #     @balance = @balance.current_balance + @transaction.amount
  #   #   else
  #   #     @balance = @balance.current_balance - @transaction.amount
  #   #   end
  #   #   redirect_to balances_path, notice: 'Transaction was successfully created.'
  #   # else
  #   #   render :new
  # end

  # def create
  #   @transaction = Transaction.new(transaction_params)
  #   @transaction.balance = @balance
  #   if @transaction.save
  #     redirect_to balance_path(@transaction), notice: 'Transaction was successfully created.'
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  private

  def set_transaction
    @balance = Balance.find(params[:balance_id])
  end

  def transaction_params
    params.require(:transaction).permit(:date, :amount, :description, :payment_method, :category, :transaction_type)
  end
end
