class CreateOperatingCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :operating_companies do |t|
      t.integer :record_type
      t.string :date_of_file
      t.string :LDC_name
      t.string :file_from_date
      t.string :file_to_date

      t.timestamps
    end
  end
end
