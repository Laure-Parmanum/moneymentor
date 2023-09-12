class Balance < ApplicationRecord
  belongs_to :user
  has_many :transactions
  has_many :target_amounts
end
