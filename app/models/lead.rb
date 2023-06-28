class Lead < ApplicationRecord
    validates_uniqueness_of :customer_name, scope: [:service_address_1, :service_city, :service_state, :service_postal_code]
  end
  