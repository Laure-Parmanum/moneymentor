class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @balances = Balance.all
    # @targets = Target.all
    # @transactions = Transaction.all
  end
end
