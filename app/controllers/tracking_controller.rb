class TrackingsController < ApplicationController
  before_action :authenticate_user
  before_action :set_target

  def new
    @tracking = @target.trackings.build
  end

  def create
    @tracking = @target.trackings.build(tracking_params)
    if @tracking.save
      redirect_to target_path(@target), notice: 'Tracking data was successfully added.'
    else
      render :new
    end
  end

  private

  def set_target
    @target = current_user.targets.find(params[:target_id])
  end

  def tracking_params
    params.require(:tracking).permit(:value, :date)
  end
end
