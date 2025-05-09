class CreateEducations < ActiveRecord::Migration[7.1]
  def change
    create_table :educations do |t|
      t.string :institution
      t.string :degree
      t.string :field_of_study
      t.date :start_date
      t.date :end_date
      t.text :description

      t.timestamps
    end
  end
end
