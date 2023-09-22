class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # @targets = Target.all
    # @balances = Balance.all
  end

  def about
  end
end
