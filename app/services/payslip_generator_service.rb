# frozen_string_literal: true

require_relative '../../lib/payslip_calculator'

# app/services/payslip_generator_service.rb
class PayslipGeneratorService
  include PayslipCalculator

  def initialize(name, annual_salary)
    @name = name
    @annual_salary = annual_salary.to_f
  end

  def call
    Payslip.create(employee_name: @name, annual_salary: @annual_salary.to_f,
                   monthly_income_tax: monthly_income_tax(@annual_salary))

    {
      employee_name: @name,
      gross_monthly_income: format('%.2f', monthly_income(@annual_salary)),
      monthly_income_tax: format('%.2f', monthly_income_tax(@annual_salary)),
      net_monthly_income: format('%.2f', net_monthly_income(@annual_salary))
    }
  end
end
