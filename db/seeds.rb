# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Balance.create([
#   {
#     balance: 6000,
#     last_update_date: Date.new(2023, 9, 5) },
# ])

# Transaction.create([
#   {
#     account_id: 1,
#     amount: -2000,
#     description: "Groceries",
#     transaction_date: Date.new(2023, 1, 5) },
#   { account_id: 1, amount: -500, description: "Dinner", transaction_date: Date.new(2023, 1, 10) },
# ])

# TargetAmount.create([
#   {
#     account_id: 1,
#     target_amount: 10000,
#     target_description: "Emergency Fund",
#     target_date: Date.new(2023, 12, 31)
#   },
# ])
# TargetAmount.destroy_all
# Balance.destroy_all
# User.destroy_all

# user = User.create(email: "test@gmail.com", password: "password")
# balance = Balance.create(user: User.first)
# targetamount = TargetAmount.create(target_date: DateTime.now, target_amount: 1000, status: true, balance: balance)
# transaction = Transaction.create(date: 14/09/2023, amount: 5000, description: "telephone bill", payment_method: "cash", category: "utilities", currency: "$", type: "Credit" )



Transaction.destroy_all
Balance.destroy_all
User.destroy_all
# Create a test user
user = User.create(
  email: 'test@example.com',
  encrypted_password: Devise.friendly_token[0, 20],
  first_name: 'Test',
  last_name: 'User',
  date_of_birth: Date.new(1990, 1, 1)
)
# Create a test balance for the user
balance = Balance.create(
  date: Date.today,
  current_balance: 1000.0,
  user: user,
  account_number: 1234567890
)
# Create test debit and credit transactions
debit_transaction = Transaction.create(
  date: Date.today,
  amount: 500.0, # Debit amount (positive)
  description: 'Test Debit',
  payment_method: 'Credit Card',
  category: 'Expense',
  balance: balance,
  currency: 'USD',
  type: 'debit'
)
credit_transaction = Transaction.create(
  date: Date.today,
  amount: -300.0, # Credit amount (negative)
  description: 'Test Credit',
  payment_method: 'Bank Transfer',
  category: 'Income',
  balance: balance,
  currency: 'USD',
  type: 'credit'
)
puts 'Seed data created successfully.'
