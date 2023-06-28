class AddOperatingCompanyIdToServiceDeliveryPoints < ActiveRecord::Migration[7.0]
  def change
    add_column :service_delivery_points, :operating_company_id, :integer
  end
end
