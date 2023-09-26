class TargetAmount < ApplicationRecord
  belongs_to :balance
  # belongs_to :user
  # Target is relative to balance
  # Target is achieved when the amount in balance is met with balance amount and as such greater balance
end
