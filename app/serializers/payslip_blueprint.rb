# frozen_string_literal: true

# app/serializers/payslip_blueprint.rb
class PayslipBlueprint < Blueprinter::Base
  identifier :id
  fields :employee_name, :annual_salary, :monthly_income_tax
  field :created_at, name: :time_stamp
end
