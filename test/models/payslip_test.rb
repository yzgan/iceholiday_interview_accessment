require "test_helper"

class PayslipTest < ActiveSupport::TestCase
  include PayslipCalculator

  setup do
    annual_salary = 60_000
    @payslip = Payslip.new(employee_name: 'Annie', annual_salary:, monthly_income_tax: monthly_income_tax(annual_salary))
  end

  test 'valid payslip' do
    assert @payslip.valid?
  end

  test 'invalid without employee name' do
    @payslip.employee_name = nil
    refute @payslip.valid?
    assert_not_empty @payslip.errors[:employee_name], 'no validation error for employee name present'
  end

  test 'invalid without annual salary' do
    @payslip.annual_salary = nil
    refute @payslip.valid?
    assert_not_empty @payslip.errors[:annual_salary], 'no validation error for annual salary present'
  end

  test 'invalid without monthly income tax' do
    @payslip.monthly_income_tax = nil
    refute @payslip.valid?
    assert_not_empty @payslip.errors[:monthly_income_tax], 'no validation error for monthly income tax present'
  end
end
