class TargetsController < ApplicationController
  before_action :set_target, only: [:show, :edit, :update, :destroy]

  def index
    # @targets = current_user.targets
    @targets = TargetAmount.all
  end

  def show
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
    redirect_to targets_url, notice: 'Target was successfully destroyed.'
  end

  private

  def set_target
    @target = Target.find(params[:id])
  end

  def target_params
    params.require(:target).permit(:target_date, :target_amount, :balance_id, :status, :history_transaction)
  end
end
