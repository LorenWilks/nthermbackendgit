class RenameBillingPostalCodeColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :service_delivery_points, :billing_Postal_code, :billing_postal_code
  end
end
