# frozen_string_literal: true

require 'test_helper'

class PayslipsControllerTest < ActionDispatch::IntegrationTest
  test 'index able to list all payslips' do
    get payslips_path
    assert_response :success

    assert_equal 2, @response.parsed_body[:salary_computations].size
    payslip = @response.parsed_body[:salary_computations].last
    assert_equal 'Muthu', payslip[:employee_name]
    assert_equal 100_000, payslip[:annual_salary].to_f
    assert_equal 1333.33, payslip[:monthly_income_tax].to_f
    assert_not_nil payslip[:time_stamp].to_datetime
  end

  test 'create able to generate monthly payslip' do
    assert_difference 'Payslip.count', 1 do
      post payslips_path, params: { employee_name: 'Annie', annual_salary: 60_000 }
    end
    assert_response :success

    assert_equal 'Annie', @response.parsed_body['employee_name']
    assert_equal '5000.00', @response.parsed_body['gross_monthly_income']
    assert_equal '500.00', @response.parsed_body['monthly_income_tax']
    assert_equal '4500.00', @response.parsed_body['net_monthly_income']
  end
end
