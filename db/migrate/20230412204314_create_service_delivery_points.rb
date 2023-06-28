class CreateServiceDeliveryPoints < ActiveRecord::Migration[7.0]
  def change
    create_table :service_delivery_points do |t|
      t.integer :record_type
      t.string :profile_group
      t.string :customer_name
      t.string :service_address_1
      t.string :service_address_2
      t.string :service_city
      t.string :service_state
      t.string :service_postal_code
      t.string :billing_address_1
      t.string :billing_address_2
      t.string :billing_city
      t.string :billing_state
      t.string :billing_postal_code
      t.string :billing_country_code
      t.string :EDU_tariff_code
      t.string :EDU_tariff_description
      t.string :rider
      t.string :monthly_billing_date_from
      t.string :monthly_billing_date_to

      t.timestamps
    end
  end
end
