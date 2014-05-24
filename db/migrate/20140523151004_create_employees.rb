class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :full_name
      t.integer :age
      t.integer :dependents
      t.float :salary_per_day
      t.integer :number_of_months
      t.integer :absences
      t.string :status

      t.timestamps
    end
  end
end
