class TargetAmountsController < ApplicationController
  before_action :set_target, only: [:show, :edit, :update, :destroy]

  def index
    # search all balances which belongs to the current user
    @balances = Balance.all.where(user: current_user)
    # search all target amounts which belongs to the balances created from current user
    @targets = TargetAmount.all.where(balance: @balances)
    # @targets = current_user.target_amounts.includes(:balance)

#     to check code written by Arnaud ~ should be displayed in index
#     @remaining_amount = calculate_remaining_amount
#     @target_data = generate_target_data
  end

  def show

  end

  def new
    @target = TargetAmount.new
    @target.status = 'Not Achieved'
  end

  # /targets
  def create
    @target = TargetAmount.new(target_params)

    if @target.save
      redirect_to target_amounts_path, notice: 'Target amount created!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # /edit
  def edit

  end

  # update
  def update
    if @target.update(target_params)
      redirect_to target_amounts_path, notice: 'Target was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # /delete
  def destroy
    @target.destroy
    redirect_to target_amounts_path, status: :see_other
  end

  private

  def set_target
    @target = TargetAmount.find(params[:id])
  end

  def target_params
    params.require(:target_amount).permit(:id, :target_date, :target_amount, :balance_id, :status)
  end
end
