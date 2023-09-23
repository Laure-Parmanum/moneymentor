class TargetAmountsController < ApplicationController
  before_action :set_target, only: [:show, :edit, :update, :destroy]

  def index

    @targets = TargetAmount.all

     # code added by arnaud
     @remaining_amount = calculate_remaining_amount
     @target_data = generate_target_data


    # @targets = current_user.TargetAmount.all
    # @targets = TargetAmount.all
    # @targets = TargetAmount.where(user_id: current_user.id)
    @balances = Balance.all.where(user: current_user)
    @targets = @balances.each do |balance|
      balance.target_amounts
    end
    # to check code written by Arnaud ~ should be displayed in index
    @remaining_amount = calculate_remaining_amount
    @target_data = generate_target_data

  end

  def show
    @targets = TargetAmount.all
  end

  def new
    @target = TargetAmount.new
  end

  # /targets
  def create
    @target = TargetAmount.new(target_params)

    if @target.save
      redirect_to @target, notice: 'Target was successfully created.'
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
      redirect_to @target, notice: 'Target was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  #/delete
  def destroy
    @target.destroy
    redirect_to target_amounts_url, notice: 'Target was successfully destroyed.'
  end

  private

  def set_target
    @target = TargetAmount.find(params[:id])
  end

  def target_params
    params.require(:target).permit(:target_date, :target_amount, :balance_id, :status)
  end

   # code added by arnaud
   def calculate_remaining_amount

 

    # For example, summing up completed targets
    completed_targets = TargetAmount.where(status: true)
    total_completed_amount = completed_targets.sum(:target_amount)
    total_target_amount = TargetAmount.sum(:target_amount)
    remaining_amount = total_target_amount - total_completed_amount
    return remaining_amount
  end

  def generate_target_data
    # Generate data for the chart

    target_labels = []
    target_data = []

    @targets.each do |target|
      target_labels << target.target_date.strftime('%Y-%m-%d')
      target_data << target.target_amount
    end

    {
      labels: target_labels,
      data: target_data
    }
  end
end
