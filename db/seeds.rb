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



# Transaction.destroy_all
# Balance.destroy_all
# User.destroy_all
# # Create a test user
# user = User.create(
#   email: 'test@example.com',
#   password: "password",
#   first_name: 'Test',
#   last_name: 'User',
#   date_of_birth: DateTime.new(1990, 1, 1)
# )
# # Create a test balance for the user
# balance = Balance.create(
#   date: Date.today,
#   current_balance: 1000.0,
#   user: user,
#   account_number: 1234567890
# )
# # Create test debit and credit transactions
# debit_transaction = Transaction.create(
#   date: Date.today,
#   amount: 500.0, # Debit amount (positive)
#   description: 'Test Debit',
#   payment_method: 'Credit Card',
#   category: 'Expense',
#   balance: balance,
#   currency: 'USD',
#   transaction_type: 'debit'
# )
# credit_transaction = Transaction.create(
#   date: Date.today,
#   amount: 300.0, # Credit amount (negative)
#   description: 'Test Credit',
#   payment_method: 'Bank Transfer',
#   category: 'Income',
#   balance: balance,
#   currency: 'USD',
#   transaction_type: 'credit'
# )

# # Create test target amount

# target_amount = TargetAmount.create!(
#   target_date: Date.today,
#   target_amount: 50000,
#   status: "not acheived",
#   balance: balance
#   )
#   puts 'Seed data created successfully.'

require 'faker'

# Clear the database before seeding
puts 'Clearing the database...'

Transaction.destroy_all
TargetAmount.destroy_all
Balance.destroy_all
User.destroy_all


# Create 5 sample users with associated data
puts 'Creating sample data...'
5.times do
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: 'password',  # Set a default password for simplicity
    date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65)
  )
  # Create a balance for each user
  balance = Balance.create(
    date: Faker::Date.between(from: 1.year.ago, to: Date.today),
    current_balance: Faker::Number.decimal(l_digits: 2),
    account_number: Faker::Number.unique.number(digits: 8),
    user: user
  )
  # Create a target amount for each balance
  target_amount = TargetAmount.create(
    target_date: Faker::Date.forward(days: 30),
    target_amount: Faker::Number.decimal(l_digits: 2),
    status: ['achieve', 'not achieve'].sample,
    balance: balance
  )
  # Create random transactions for each balance
  5.times do
    transaction_type = ['Debit', 'Credit'].sample
    amount = Faker::Number.decimal(l_digits: 2)
    currency = 'USD'
    category = Faker::Lorem.word
    description = Faker::Lorem.sentence
    payment_method = ['Credit Card', 'Cash', 'Bank Transfer'].sample
    Transaction.create(
      date: Faker::Date.between(from: 1.year.ago, to: Date.today),
      amount: amount,
      description: description,
      payment_method: payment_method,
      category: category,
      currency: currency,
      transaction_type: transaction_type,
      balance: balance
    )
  end
end
puts 'Sample data created successfully!'
