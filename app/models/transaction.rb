class Transaction < ApplicationRecord
  belongs_to :balance
   # Custom validation to determine the type (credit or debit)
  # validate :determine_type_based_on_amount

  # def update_balance
  #   #logic update balance

  # end
  #  private
  # def determine_type_based_on_amount
  #   if amount.nil?
  #     errors.add(:amount, "can't be blank")
  #   elsif amount >= 0
  #     self.type = 'debit'
  #   else
  #     self.type = 'credit'
  #   end
  # end
end
