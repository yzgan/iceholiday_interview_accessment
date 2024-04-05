# frozen_string_literal: true

# app/services/payslip_generator_service.rb
class PayslipGeneratorService
  def initialize(name, annual_salary)
    @name = name
    @annual_salary = annual_salary.to_f
  end

  def call
    {
      employee_name: @name,
      gross_monthly_income: format('%.2f', monthly_income(@annual_salary)),
      monthly_income_tax: format('%.2f', monthly_income_tax(@annual_salary)),
      net_monthly_income: format('%.2f', net_monthly_income(@annual_salary))
    }
  end
end
