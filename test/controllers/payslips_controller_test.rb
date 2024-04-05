require "test_helper"

class PayslipsControllerTest < ActionDispatch::IntegrationTest
  test 'create able to generate monthly payslip' do
    post payslips_path, params: { employee_name: 'Annie', annual_salary: 60_000 }
    assert_response :success

    assert_equal 'Annie', @response.parsed_body['employee_name']
    assert_equal '5000.00', @response.parsed_body['gross_monthly_income']
    assert_equal '500.00', @response.parsed_body['monthly_income_tax']
    assert_equal '4500.00', @response.parsed_body['net_monthly_income']
  end
end
