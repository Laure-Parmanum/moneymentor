class TargetController < ApplicationController
  before_action :authenticate_user
  before_action :set_target, only: [:show, :edit, :update, :destroy]

  def index
    @targets = current_user.targets
  end

  def show
  end

  def new
    @target = current_user.targets.build
  end

  def create
    @target = current_user.targets.build(target_params)
    if @target.save
      redirect_to targets_path, notice: 'Target was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @target.update(target_params)
      redirect_to targets_path, notice: 'Target was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @target.destroy
    redirect_to targets_path, notice: 'Target was successfully destroyed.'
  end

  private

  def set_target
    @target = current_user.targets.find(params[:id])
  end

  def target_params
    params.require(:target).permit(:name, :description, :due_date)
  end
end
