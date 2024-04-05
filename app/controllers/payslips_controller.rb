# frozen_string_literal: true

# app/controllers/payslips_controller.rb
class PayslipsController < ApplicationController
  def create
    service = PayslipGeneratorService.new(params[:employee_name], params[:annual_salary])
    render json: service.call
  end
end
