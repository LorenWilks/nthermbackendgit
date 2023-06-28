class ServiceDeliveryPoint < ApplicationRecord

  def self.create_from_parsed_data(data)
    sdp = ServiceDeliveryPoint.create(
      customer_name: data[:customer_name],
      service_address_1: data[:service_address_1],
      service_address_2: data[:service_address_2],
      service_city: data[:service_city],
      service_state: data[:service_state],
      service_postal_code: data[:service_postal_code],
      billing_address_1: data[:billing_address_1],
      billing_address_2: data[:billing_address_2],
      billing_city: data[:billing_city],
      billing_state: data[:billing_state],
      billing_postal_code: data[:billing_postal_code],
      # other attributes...
    )
    
    if sdp.errors.any?
      Rails.logger.error "Failed to save ServiceDeliveryPoint: #{sdp.errors.full_messages.join(', ')}"
    else
      Rails.logger.info "Successfully saved ServiceDeliveryPoint: #{sdp.inspect}"
    end
  end
end
