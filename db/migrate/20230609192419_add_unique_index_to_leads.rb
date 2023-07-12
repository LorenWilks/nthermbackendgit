class AddUniqueIndexToLeads < ActiveRecord::Migration[7.0]
  def change
    add_index :leads, [:customer_name, :service_postal_code], unique: true, name: 'unique_lead'
  end
end

