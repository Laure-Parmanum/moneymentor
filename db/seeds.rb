# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


Income.create([
  {
    source: "Job",
    amount: 5000,
    date: Date.new(2023, 1, 1) },
  { source: "Freelancing", amount: 1000, date: Date.new(2023, 1, 15) },
 ])

Balance.create([
  {
    balance: 6000,
    last_update_date: Date.new(2023, 9, 5) },
])

Transaction.create([
  {
    account_id: 1,
    amount: -2000,
    description: "Groceries",
    transaction_date: Date.new(2023, 1, 5) },
  { account_id: 1, amount: -500, description: "Dinner", transaction_date: Date.new(2023, 1, 10) },
])

TargetAmount.create([
  {
    account_id: 1,
    target_amount: 10000,
    target_description: "Emergency Fund",
    target_date: Date.new(2023, 12, 31)
  },
])
