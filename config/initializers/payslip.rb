# frozen_string_literal: true

require_relative '../../lib/payslip'

# config/initializers/payslip.rb
class Object
  include Payslip
  def generate_monthly_payslip(name, annual_salary)
    puts "Monthly Payslip for: #{name}"
    puts "Gross Monthly Income: $#{format '%.2f', montly_income(annual_salary)}"
    puts "Monthly Income Tax: $#{format '%.2f', monthly_income_tax(annual_salary)}"
    puts "Net Monthly Income: $#{format '%.2f', net_monthly_income(annual_salary)}"
  end
end

# generate_monthly_payslip "Annie", 60000
