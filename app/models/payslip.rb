# frozen_string_literal: true

# app/models/payslip.rb
class Payslip < ApplicationRecord
  validates :employee_name, :annual_salary, :monthly_income_tax, presence: true
end
