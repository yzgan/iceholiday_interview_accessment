# frozen_string_literal: true

# lib/payslip.rb
module Payslip
  SALARY_RANGE = [0..20_000, 20_001..40_000, 40_001..80_000, 80_001..180_000, 180_001..Float::INFINITY].freeze
  TAX_RATE = [0, 0.1, 0.2, 0.3, 0.4].freeze

  private

  def montly_income(annual_salary) = (annual_salary.to_f / 12).round(2)
  def monthly_income_tax(annual_salary) = (annual_income_tax(annual_salary).to_f / 12).round(2)
  def net_monthly_income(annual_salary) = montly_income(annual_salary) - monthly_income_tax(annual_salary)

  def taxable_amount(annual_salary)
    SALARY_RANGE.map do |range|
      offset = (range.min.zero? ? 0 : 1)
      next range.max - range.min + offset if annual_salary >= range.max
      next annual_salary - range.min + offset if annual_salary >= range.min && annual_salary < range.max

      0
    end
  end

  def annual_income_tax(annual_salary)
    taxable_amount(annual_salary)
      .zip(TAX_RATE)
      .map { |set| set.reduce(&:*) }
      .sum
      .round(2)
  end
end
