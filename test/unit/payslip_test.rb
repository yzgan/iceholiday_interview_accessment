# frozen_string_literal: true

require 'test_helper'

# test/unit/payslip_test.rb
class PayslipTest < ActiveSupport::TestCase
  test 'generate monthly payslip' do
    assert Object.method_defined?(:generate_monthly_payslip)
  end

  test 'montly income' do
    annual_salary = 60_000
    assert_equal 5_000, monthly_income(annual_salary)
  end

  test 'monthly income tax' do
    annual_salary = 60_000
    assert_equal 500, monthly_income_tax(annual_salary)
  end

  test 'net monthly income' do
    annual_salary = 60_000
    assert_equal 4_500, net_monthly_income(annual_salary)
  end
end
