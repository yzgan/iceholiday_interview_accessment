class CreatePayslips < ActiveRecord::Migration[7.1]
  def change
    create_table :payslips do |t|
      t.string :employee_name, null: false
      t.decimal :annual_salary, null: false
      t.decimal :monthly_income_tax, null: false

      t.timestamps
    end
  end
end
